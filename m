Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234A84BF03
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 22:00:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KqswiOp9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTwct16QQz3cjv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 08:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KqswiOp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTwc40vvSz3bwk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 07:59:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36485616AC;
	Tue,  6 Feb 2024 20:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C7CC433F1;
	Tue,  6 Feb 2024 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707253184;
	bh=ZwkOqNYlxYx2ROZjI6aEXfhXktUM4H16pbtLQQ1r4qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqswiOp92+ueqbOZB/1JVuSczU4VL4FoQQ3ZcFnvAa8HxR3oe3IAdXJ5e/zEFL0kz
	 tvLD6/rXLg4Lr5vX7XBEeeb/zqbx8dwzJ3wkgVAn75Rci42JuQdcekUtVJ5EAKjXoc
	 UMvCRSPfzXSlphpIqOnFQcjhjDXohgJQTKtvfjJiLgxrrk2z9teRgkCjYW0PHPw83c
	 kTtEaSj4aH7jTJ3A/vLtNjqQtRHFF/UOjHtS5xz5L5WAcwG75+qVp/tuaCCR3dER+X
	 4uYdV//J/yixoHqfG7UM9+I9gn2C3FSz7XxcATPZRtNmZe/4hD2iWXRDIF6bC28Er0
	 /PxQ5eX4C15vA==
From: Namhyung Kim <namhyung@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	acme@kernel.org,
	jolsa@kernel.org,
	irogers@google.com
Subject: Re: [PATCH] perf/pmu-events/powerpc: Update json mapfile with Power11 PVR
Date: Tue,  6 Feb 2024 12:59:41 -0800
Message-ID: <170725313989.2448546.10195649247614076762.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240129120855.551529-1-maddy@linux.ibm.com>
References: <20240129120855.551529-1-maddy@linux.ibm.com>
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jan 2024 17:38:55 +0530, Madhavan Srinivasan wrote:
> Update the Power11 PVR to json mapfile to enable
> json events. Power11 is PowerISA v3.1 compliant
> and support Power10 events.
> 
> 

Applied to perf-tools-next, thanks!

Best regards,
-- 
Namhyung Kim <namhyung@kernel.org>
