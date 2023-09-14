Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDC7A01C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U2JitcWc;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7Vh8jgl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmYbw3Npwz3cBL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U2JitcWc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7Vh8jgl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmYb36BRKz3c1V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:34:07 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 083171F854;
	Thu, 14 Sep 2023 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694687643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnfPmNtqKsvG7dCcr+XCTSyVIUc/H8QoYYVZgMuRg0o=;
	b=U2JitcWcgj0eXzLT+JBmc2Cxb1QMzIKNcw/Dn0Ez3gyE6BRsX4fLId+GZNdYv+fCu3DtQn
	7XHFNNWuV4eABQEXznhVaYVNc6otruFOd+yhPpnuhgOm7i4appyjgCO4Q/Fr+RixUkAH0c
	ZBD22AVrqvieKd08zBfE5zGoKXFyRb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694687643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnfPmNtqKsvG7dCcr+XCTSyVIUc/H8QoYYVZgMuRg0o=;
	b=S7Vh8jgldkYpZbrl7QdDL5V5NPP/o3otjaLQFo/qPXXRpJcfkUHNUY7AQNn/w5yn9HlKot
	aeBhRJR06C7vgBDQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2FB0F2C142;
	Thu, 14 Sep 2023 10:34:01 +0000 (UTC)
Date: Thu, 14 Sep 2023 12:34:00 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
Message-ID: <20230914103400.GX8826@kitsune.suse.cz>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
 <20230913185951.GA3643621@dev-arch.thelio-3990X>
 <877cot8k9f.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cot8k9f.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, Nathan Chancellor <nathan@kernel.org>, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Sep 14, 2023 at 02:13:32PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Greg,
> >
> > On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> >> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >>
> >> Define operations for SED Opal to read/write keys
> >> from POWER LPAR Platform KeyStore(PLPKS). This allows
> >> non-volatile storage of SED Opal keys.
> >>
> >> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> >> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >
> > After this change in -next as commit 9f2c7411ada9 ("powerpc/pseries:
> > PLPKS SED Opal keystore support"), I see the following crash when
> > booting some distribution configurations, such as OpenSUSE's [1] (the
> > rootfs is available at [2] if necessary):
> 
> Thanks for testing Nathan.
> 
> The code needs to check plpks_is_available() somewhere, before calling
> the plpks routines.

would this fixup do it?

I don't really see any other place to plug the check with the current
code structure.

Thanks

Michal

diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
index c1d08075e850..f8038d998eae 100644
--- a/arch/powerpc/platforms/pseries/plpks_sed_ops.c
+++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
@@ -64,6 +64,9 @@ int sed_read_key(char *keyname, char *key, u_int *keylen)
 	int ret;
 	u_int len;
 
+	if (!plpks_is_available())
+		return -ENODEV;
+
 	plpks_init_var(&var, keyname);
 	var.data = (u8 *)&data;
 	var.datalen = sizeof(data);
@@ -89,6 +92,9 @@ int sed_write_key(char *keyname, char *key, u_int keylen)
 	struct plpks_sed_object_data data;
 	struct plpks_var_name vname;
 
+	if (!plpks_is_available())
+		return -ENODEV;
+
 	plpks_init_var(&var, keyname);
 
 	var.datalen = sizeof(struct plpks_sed_object_data);
-- 
2.41.0

