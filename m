Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43512350E7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 07:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9sXD21Pzz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 16:42:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=rOXIoH3g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=rOXIoH3g; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9sWQ4WnHz30Jw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 16:41:54 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9sWH6GnSz9sXG; Thu,  1 Apr 2021 16:41:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617255707; bh=ShIYCkm+a+E/L5x1YqUqzLYIUICGsINcpthrkowfw8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOXIoH3gRGYNgxnxA/tpVV/tYox8MEOCL9nu1DPilZTqVVmSXnnvdtNMx+7hIH0S5
 nLWSjnKd87DLNQqORi/Hmg3hn9VI+eTbQ6gpNVjE5jeOMf1YyHbTNrO2Z4yEnnYTgd
 QXX5HaX7xzF4YLlb5Iqa0CWgG5pPHRlLp7o91vQgWfVhRV2fAxAQmEr3sLW5Qf6K94
 KWoce9JdOiiTO7FK0/KQ7ignqphWdPNLAkNVAIE0Gcz5KFKhID8knvUoD+zMpA4xnl
 P1dpoJt0lt7QhaCDQXYUHgJUNM1IcVUpXouvmNZii9IksIV/CZpoNJcMzymp8RgUpZ
 7WoDLvtYAm3aQ==
Date: Thu, 1 Apr 2021 15:29:21 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 12/46] KVM: PPC: Book3S 64: move KVM interrupt entry
 to a common entry point
Message-ID: <YGVMITBR0CZY1Odc@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-13-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-13-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:31AM +1000, Nicholas Piggin wrote:
> Rather than bifurcate the call depending on whether or not HV is
> possible, and have the HV entry test for PR, just make a single
> common point which does the demultiplexing. This makes it simpler
> to add another type of exit handler.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
