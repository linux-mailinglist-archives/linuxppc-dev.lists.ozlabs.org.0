Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589749176FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 05:56:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hLvaWupV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W87Dc2042z30W8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 13:56:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hLvaWupV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W87CB6ZQYz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 13:55:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B2EFCE2050;
	Wed, 26 Jun 2024 03:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAA7C2BD10;
	Wed, 26 Jun 2024 03:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719374126;
	bh=cZW15rkezFij8vUtEoWV8jBJvT/WhVRdxJxw5hfrtMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLvaWupV2+pyLqQ1moqG1DnqXIbAqZZdQshb2jBLYdrwteEqjEDb/KscZWKlA7WFo
	 UreXe96oeTjZH1ZIjklxxj2UHZEVPrpkhW+bZzovAVrS9lh+QzkoQtxf0aH7MWT7Rw
	 D7XXiBtkGx5hWVkZCCnWeHWiaa9DxhF9vyN5coC6bykOGFh6rq9lAIPhPjAws/qVSZ
	 xlNsxmzhPg2wct7GGcRyGPFxzs5m1XOA7ZfxK+n08UV3/8e7JnJdOD1Nk0K9B23aRx
	 DV8RdXMbZ6bM3z4bZvhguwaB77MkFjemUHfj+DGCdntL0cbyBX3+IBd4qDOUmN4OWX
	 /VMQUqqHXWl+Q==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	irogers@google.com,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V4 1/3] tools/perf: Fix the string match for "/tmp/perf-$PID.map" files in dso__load
Date: Tue, 25 Jun 2024 20:55:23 -0700
Message-ID: <171937399821.2856850.15411826419678386958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 23 Jun 2024 12:18:48 +0530, Athira Rajeev wrote:

> Perf test for perf probe of function from different CU fails
> as below:
> 
> 	./perf test -vv "test perf probe of function from different CU"
> 	116: test perf probe of function from different CU:
> 	--- start ---
> 	test child forked, pid 2679
> 	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Msa7iy89bx/testfile
> 	  Error: Failed to add events.
> 	--- Cleaning up ---
> 	"foo" does not hit any event.
> 	  Error: Failed to delete events.
> 	---- end(-1) ----
> 	116: test perf probe of function from different CU                   : FAILED!
> 
> [...]

Applied the series to perf-tools-next, thanks!

Best regards,
Namhyung
