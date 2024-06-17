Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADB90BB60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 21:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=mnZWjMMH;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=JxNXz4hM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W30nc42PRz3g3v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 05:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=mnZWjMMH;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=JxNXz4hM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=96.44.175.130; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 343 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 05:48:31 AEST
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W30mv0Hv5z3gBn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 05:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718653355;
	bh=1vcmeQncdRyeP1TvaAAoOSNuO5Z2zRz6JdZWHlyc5wU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mnZWjMMH2Pf/d/viFToDHlEEbQ8HapspA6ZtZT+kGzj2dfKsXkB+8bEXLYrITguK+
	 NhnGQoYWNqSqgNEmKjM8VNJzH1iRqRhtR5gprRK1Wzl90YRWaic93Er+4w4p4KtU1W
	 kqGa+OmkXJDMWZtsWDI83weBETvlGLVnmvHpVieo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 23FA71287250;
	Mon, 17 Jun 2024 15:42:35 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 6AnscMlQ7NK4; Mon, 17 Jun 2024 15:42:35 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718653354;
	bh=1vcmeQncdRyeP1TvaAAoOSNuO5Z2zRz6JdZWHlyc5wU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=JxNXz4hMIJNuIaS2NAP/VmIBIqhBMsY90IEZCeCGJOh67Z+KbLhKYCyMbh5iyytP9
	 fn7ydQPacHeEFBG6cB+WnQaQitcP3DESIbyxtYuw5Hz5w948hQI8qpy4KM8souBzmc
	 NDgDGVPY1QydIfxAFzf/3sTMQuIUtrGMorgI1SWI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 510EE12870A6;
	Mon, 17 Jun 2024 15:42:34 -0400 (EDT)
Message-ID: <dfc4feaef0d63d616bab8cdec5d409369f9dacf1.camel@HansenPartnership.com>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Stefan Berger <stefanb@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, jarkko@kernel.org
Date: Mon, 17 Jun 2024 15:42:32 -0400
In-Reply-To: <20240617193408.1234365-1-stefanb@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-06-17 at 15:34 -0400, Stefan Berger wrote:
> Fix the following type of error message caused by a missing call to
> tpm2_sessions_init() in the IBM vTPM driver:
> 
> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error
> 0x01C4
> [    2.987140] ima: Error Communicating to TPM chip, result: -14
> 
> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
> b/drivers/char/tpm/tpm_ibmvtpm.c
> index d3989b257f42..1e5b107d1f3b 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
> *vio_dev,
>                 rc = tpm2_get_cc_attrs_tbl(chip);
>                 if (rc)
>                         goto init_irq_cleanup;
> +
> +               rc = tpm2_sessions_init(chip);
> +               if (rc)
> +                       goto init_irq_cleanup;

This looks wrong: the whole thing is designed to occur in the bootstrap
phase from tpm_chip_register() (which tpm_ibmvtpm.c definitely calls),
so why isn't it happening?

James

