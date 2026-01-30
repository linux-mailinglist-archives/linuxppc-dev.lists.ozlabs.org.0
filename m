Return-Path: <linuxppc-dev+bounces-16413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LJs6AJASfGm4KQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 03:08:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6578B652F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 03:08:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2KDB59YFz2xjP;
	Fri, 30 Jan 2026 13:08:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769735800;
	cv=pass; b=KSRnTkRw8P+8ujGNyrGDzkafAB7VJMFV9/QYvCYa8qHexWmD6PRFV/eXdrdRLJNji52AsRGFbCK3EFT7RzuFestrZuTDy5PjXtDhGXQiPHucZ4K0ymO+luo5fsxiMU5YjdcqHox+VumDOjMBBzg+U97b+ZsxBJKpjOtPZ1MHYgtYGkBb9mMdKNGq+7fgclfRQ/4/eg+eFGTjzSiI+8MBDgWvbZMdc1b1mvuec7/SeWiTxsRWOBGc7a47kTuaAZqMtGfvK9b1GALc7tf9rCLKSQDPoQlLBD12naRPR6T7P9WoWtnK2CzaZxx7vwt80yvAxOHzFTMX1wjfLiuVI3hm2g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769735800; c=relaxed/relaxed;
	bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJFrEUsDA+MbK4PzdzsR46GQU5SoyP9/G9sE+WSmuOy5XUcokeS7EtbmN0xZVyi0M6rhMZeB7K4jh63oP9+ZB7+YhaJnyFObVcUA8c78/5MQcHmtwLblDGIHFj4ECGJJI8Mv51m/aRret5VLOrYc6sB/6o9as+fuByJSI0O2hN2+DrE9WvByDRNvaPGNtJgGPo/1pB0c4WDK3lj8vpxQkDPLBkoaLBV4WhQpSV7uPxKZTIxXP1tL2dOo8EwYzGcZLcLDHot9HNYakxkCT0JmPRZf1SfmTaNodOpBRxjHscVVCx4YUQgnC6jytDRF1X8jW7rgbBvwZkAT3f1WKCWdAw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uhkQBUIj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uhkQBUIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2J4k3Dyfz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 12:16:37 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8845cb5862so241229166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 17:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769735792; cv=none;
        d=google.com; s=arc-20240605;
        b=ghjQ6oWNUvPHwpJSeMC+S+4zetvLIBhgLbTAhdcHH/K6shAcEjjw3+w8ol/o+toO39
         bPa8hAROksgVFMxICsCdgtFNRCDHGZcOYjqTwSBCrBkndHE/OjMG+9wN8M61JdTnM4a9
         DjVjf/PUw8z8tjcaVRO78jukClgqezdMZv5U46Zp935H5pG5EzALcKfdW/EoFDu3HXv/
         mm9TpMItf6uCZmjC1Pl7abOkdq18rjeMErnwZOxbxJiLtTDtPRBVmsomBpMPbJF7CGUM
         +5jUOO8q3G3PbFF1niXjswzjm9no4Derxp8FbUqvlTNqYf2r6gYHKxo2Vukh2ZQ0dAu0
         uz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        fh=2wEYn5AmGLonLVmu5GekELfhCxYgdoWOdyz/1sW4RfU=;
        b=lq1juDGJIh9nehvYmazcO0xYxPqtp/fyp2+wmNhBVv3+XZ1xtEbpPo2KVp8F8i78S7
         2pExOMSZmu8Ws+S6g2Y4Yy8y2FSkOfAsaqcvYAmrTrxTKPTd5ZqDNKwItAWMAc24TVez
         YjN3+mvMBiwKSiPYNoVeu9FWU8c9Q5386s2LkXLTXeEQZtSHZ/iPQadyk+k9dP+Y+mci
         lND21s4WnuMIbzmN1T9iYO6I5Z607oXPEjEH3U14BusAsMDAIR3YdatkQP3T1j+pqXp2
         QxTAk3nwha1LVliIg4aylUHLBUEUZg2ut28+RepS41wQv5yUokCALbYels6FLCAOugm2
         1kKA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769735792; x=1770340592; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        b=uhkQBUIjYEmszsuQiDoyAq0RNIx3t1Ich5vDJ4SSTKvSHhXSGC0xOKqnwbQK416BDs
         VKHHkgU5dQVFvbqNUFEHZADqD8ESWGj04QASaeGAlFSW8CQkmz8IwILwUhKYvxzf5sQp
         V9wCbeJuzScpUbUdnKrp09mvMeXjETytWp8wb8/0pCgLzzsMGYkHfvByFgbxY3Nw6nF0
         FSJv4SjZHl0LNmWOrkorrtIDFFktLPZ8U/0heDqfN0Ig6klSvzDF4xfjcTpncADlj3YG
         rKWHA7uNfB7QdwAg1u7Et2xQmkAuAk+rDPiA+AHDJFxaEcyzkHaVr2ddBJoR01FmWnvr
         Zt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735792; x=1770340592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        b=s6vwSHBWKx7gIdqrjSTAal8ejfN5hwLigJbXWbdeKZwOyZeJ8/gtd5ifVmtqLexcm8
         n+54lvstEQVHLI0pJj6YYIvrBWXnQee/VWzsnV3S9y4JPko1wCjmhFrfFwVmkLWGCnHU
         48ZbhBU+DZ62Wz0TpZmsDe9crk6AUM9/sdGVQZq7t5pgqCnsvH4IOnzAJCzq1NO5f1PS
         HBrTqW2v5ZNK4hnt73O7i+h2UmTBPFdlTtpE4X3VfGUSTY5iZGWBGkpy+mhxQNTc69gj
         jl4fP/CVB4ccCpHLTZP0KOBMKP4Q7+GjNBrmyb0wpw/hPjxrn7nV2qKsiFfXwljea3q1
         6Tkw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsh6np62oCrj/vk/VNiVXPfMrxEpvCyVB6cKt9ZbbZ6l6jvfoDuVAkIfpX9xx8Y5seMgVEgkhMjLKtU0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy6/7eILpt1Rhzw+pm9mDKoaVlu4ncX655orTT9FgIaKwQ9Mwyk
	rxD7a6W8C+9chvdaqrtKzkP/VCp2U7cEuWKhHU3Fmas7/5/k9tvnYCDir9L1okyoARvNzehQLnf
	BDM0+o5SKEn/vkGWmLdqHuDZ3CV0d+zIzkrC49kd6
X-Gm-Gg: AZuq6aLxfetvcstILKrN2aDggpQdMzxmX5tu3bw/Tbq4SnFLSc2YHfLSeqUXAz4HDp5
	bZwdhCW1s6i7KXNY5x9hNNyAdyo7GjcG4a3XScoDOeJOGLL+wxo2cpYn93q2iQDop5Neb/U24e3
	HfPkMdDkjug20vs5t4AK1K0Z6LLV/bfVHl0Jti+gx0pVSfyI2Olh749LRyBZVtchIYg0u/Zbry5
	fTuIv8heUnuAol96bZ5Z9J3iCCSZKhYYYoXXn/LeLJ2mR9OcCbSsJUon4nrqM3FcOB0DPcAcYKL
	lqcMDNQHGIDRkcbhMpCjqZEc9Lj14w==
X-Received: by 2002:a17:906:eecb:b0:b88:31f9:1d9a with SMTP id
 a640c23a62f3a-b8dff71fbbcmr62042966b.62.1769735792220; Thu, 29 Jan 2026
 17:16:32 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
In-Reply-To: <20260129225433.GU3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Jan 2026 17:16:20 -0800
X-Gm-Features: AZwV_Qio50GdQN1165WVg9oPRvbdMSYV2LeALjhPJoJWlsc8zYrp7Hv8KsFMrXk
Message-ID: <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16413-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A6578B652F
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:

> > Sorry, I hadn't been clear enough: if you do
> > git switch --detach 1544775687f0
> > and build the resulting tree, does the breakage reproduce?  What I want
> > to do is to split e5bf5ee26663 into smaller steps and see which one
> > introduces the breakage, but the starting point would be verify that
> > there's no breakage prior to that.

Ultimately, same conclusion as before: 6.18-rc5 with patches up to
1544775687f0 works, but adding e5bf5ee26663 breaks it.

> > PS: v6.19-rc7 contains fc45aee66223 ("get rid of kill_litter_super()"),
> > and reverting 6ca67378d0e7 ("convert functionfs") would reintroduce
> > the call of that function in ffs_fs_kill_sb(), so the resulting tree
> > won't even build on any configs with functionfs enabledd; are you sure
> > that you'd been testing v6.19-rc7 + reverts of just these 3 commits?

I also could have been more clear- I had to
s/kill_anon_super/kill_litter_super/ as part of the revert of
6ca67378d0e7 to properly build. That felt like an appropriate change,
but if not, adding patches on top of 6.18-rc5 is perfectly fine for
testing this.

> Could you try your reproducer on mainline with the following delta applie=
d?
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 05c6750702b6..6c6d55ba0749 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -646,12 +646,11 @@ static int ffs_ep0_open(struct inode *inode, struct=
 file *file)
>         if (ret < 0)
>                 return ret;
>
> -       ffs_data_opened(ffs);
>         if (ffs->state =3D=3D FFS_CLOSING) {
> -               ffs_data_closed(ffs);
>                 mutex_unlock(&ffs->mutex);
>                 return -EBUSY;
>         }
> +       ffs_data_opened(ffs);
>         mutex_unlock(&ffs->mutex);
>         file->private_data =3D ffs;
>

This didn't work on either build variant (6.18-rc5 and 6.19-rc7).

I'm exploring a few other paths, but not having USB access makes
traditional tools a bit difficult. One thing I'm rechecking and is
worth mentioning is the lockdep below: it's been present for quite
some time now, but I'm not sure if it would have some undesired
interaction with your patch.

[ BUG: Invalid wait context ]
6.18.0-rc5-mainline-maybe-dirty-4k
-----------------------------
irq/360-dwc3/352 is trying to lock:
ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
__power_supply_set_property+0x40/0x180
other info that might help us debug this:
context-{4:4}
1 lock held by irq/360-dwc3/352:
 #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
configfs_composite_suspend+0x28/0x68
Call trace:
 show_stack+0x18/0x28 (C)
 __dump_stack+0x28/0x3c
 dump_stack_lvl+0xac/0xf0
 dump_stack+0x18/0x3c
 __lock_acquire+0x794/0x2bec
 lock_acquire+0x148/0x2cc
 down_read+0x3c/0x194
 __power_supply_set_property+0x40/0x180
 power_supply_set_property+0x14/0x20
 dwc3_gadget_vbus_draw+0x8c/0xcc
 usb_gadget_vbus_draw+0x48/0x130
 composite_suspend+0xcc/0xe4
 configfs_composite_suspend+0x44/0x68
 dwc3_thread_interrupt+0x8f8/0xc88
 irq_thread_fn+0x48/0xa8
 irq_thread+0x150/0x31c
 kthread+0x150/0x280
 ret_from_fork+0x10/0x20

