Return-Path: <linuxppc-dev+bounces-16483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPl2Jb1cfmnlXgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 20:49:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409BC3B7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 20:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3Njz5P7gz2xm3;
	Sun, 01 Feb 2026 06:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::633" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769888951;
	cv=pass; b=hzDoNqquObgWvvKUh8OEnuVBABMJQV2XNtaWbi6W//0T+7b0x9UrLZ1wpEYNOyc86qm9xb+Udh9pflbYm7chnG/vbMBYHiX0yY7D7KMhuJy8tywkwZ14Q3QUH/Ost9Hte3fmjg/wARBn7Lg02kW0m1sxHeyZ8P37zN3v27Ae4gJxD4m1H8VokO6sFmLm3+RjHYwiskfl6TVPtJbTkGP6s0ZqqApQSBJ96oTmnYQZfAFEP+2JTz/Zos0Rd0znmrCYFLtJyhdDVnrHgCYN/kaXoZAtdOpSv0H3sNijT/S5LklwnYCodoSD31H13mZJqYFU46OXLzU0dXzj2cRBbJwgjg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769888951; c=relaxed/relaxed;
	bh=pvJH79c3ek4UlgvkC3XFusrRWLJlCUgDtsKCKKtm5AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJI1OmkXhvseBs87wQIm2BAa5y55haUbCFpUKRTk/R4TJmDSP6efopMra2X1RPCA1NoGfZX0uSOn4k8zdfQCih5Tnl0SHzXgv/EjmgXtdYp5F1rfW6ypCaz5xvhELEc78cpTtdZ/fDbtbNTNdtCctVHNEMGlciLsObAqTjZchzhLvq3mb43KYd8LcyG1QIQVEM9eP/bHUZrhiVAbuHa6K6UvsLZE/nUDqWII2dt4+ZjLOL/Il+c1dN06uPeHaZWg0cv0z9Q5ZZHy0qQ+O6veQZkfpHWfuwFJQjEm7RIHnyLUpz1gRiwvgyhkKccRWGcJEDTxZMslGZ35LbnVYpyLIw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xtrzq6tp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xtrzq6tp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3Njx4dhSz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Feb 2026 06:49:09 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8845cb580bso513713766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 11:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769888941; cv=none;
        d=google.com; s=arc-20240605;
        b=bgAZ92skDM11qt+BfG/7PkpAT97gHtgUWUYx5hQiXODR0+xV7HG6NcfURf/nx1NzAU
         LiMuz/SfimRK2m9kUJ0jBpBvgtklZCWyoXCgVYG08ErKwRIT0N0DXXFzh8uLNZtE7lPY
         +5VpznJyX9UCsdGFfv0c8zEjqgjR3a5svF32lgS7I6Ko3vZ8qXtPTbRw+r+7TnOoBz/O
         BOQuTv+bjbmplhECGaH8ldZLOwkg4gb7ciDMqtc9xXloqTRcY6AvBXBzTCwRj8N4Xlim
         DSCiqXJi3amZuzzpu8emOF9DaR/+Yo34i9WdcxMUTyiK2JEK6m7SLzbgpZjTlKpsNE1C
         QxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pvJH79c3ek4UlgvkC3XFusrRWLJlCUgDtsKCKKtm5AI=;
        fh=m8WUURBsDhIiaPCFIH9JamGdqfSNTodhDAdEyju5oPQ=;
        b=URQjiLXbco9tlUqqrlHfr0lsGAaR0yvGHwsmATlPlnFnl7u5K2wMULmteZW8BshTL/
         F7AnFxd39iXFJziGFpMaE7kjQ5dj2p6Sc4kV0zjn9/JCncIkjQVO9zAdDH7dZOKTqaBg
         JIcSthEXRLoaw116iHbIPjuzvoPc3uYsEXtZ8aSA13DwH4gu7HHsDiH5lO+w6QeBjf6o
         Gl1bqKdj4WCMcqyTj8Ynrl8h4aE7K3ZUwjUZSnAzyu1AJqzVxcY3kdBQCIF4flTNh07x
         RfmjurhKJYLBpmv/ABhAHznAihYXAoC8ZxqKXaqU8W9OQ/e84L3KUkEPW1IA2sL/NFpk
         8zVQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769888941; x=1770493741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvJH79c3ek4UlgvkC3XFusrRWLJlCUgDtsKCKKtm5AI=;
        b=Xtrzq6tpWckI3YRxpeq3KIwy/W1eNRwlrXQn54L5sHA9kFYgyu0cifXo9iuU4Dmuy2
         8uWziQJaA/Q03koeRfesfOqemMnrR5C2qllLCo/BoFDNuqSV04Ikp6k/ZRQzuNlhSxt6
         mRBW+0V1rsp860LLXN5z5+ajxMR/IXpfdN4vkxLsfN+oHmMXUUkuDTAh43YthCJHTDhc
         4KL1/dkyO+4eUl3KL7DXlW4gSPhtClt3CrI6Ayj4fCPaSLuht+GkhkeEDxwwI5oYFR19
         maImg2HPXUrYhYXu/rhnWhp3QGeXi8/rdKdX7tLBXoO1xLim0fPgAhCwcftWGUROSvjy
         T63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769888941; x=1770493741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvJH79c3ek4UlgvkC3XFusrRWLJlCUgDtsKCKKtm5AI=;
        b=V91KWEIVOL+BuW1g47y0D0sLG/NpO3Xt25rkpFuY3a6b5JJnjQKp9qjK49r3ERzf41
         phxvR0TMQmCNJun8m//GU0jqlSWmYcLNVTd1Tqj7GIUvNYzw18+1Js4UsUjRjvoEVcuK
         JqjIqSrZ64qgnNv5k/eg+BFNEZIzinrhrRsoQ3zexYtp250W47g2Wc+Rm3ufdIY8fyf/
         asJMbHYq65CYURKESW2k55REtQeVkXH6Cjej5mkYfGudEOvk+ndE3RCFpIyg/olGY36C
         TepAoZq9l1XdxFRYGUdRpbo+5yySrwx83gDuxLpErFKPAKm4158yipE/Phuh5SWlGv88
         Sp5g==
X-Forwarded-Encrypted: i=1; AJvYcCXGY9GnxyLqN7w50/ujn+jhsBvsbFYq3rbxCRLx5DGZ3Pm9Sh92iSpRXF8znc1DYM/fihiNPsgeZFsITog=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZ3TXqtIoT4fkfQbs3sBV1BX9wt1Ti/7O8kVttJTMEhVZSLgBN
	tVVjrMSW4zLMfp3FENKbG8ATLlLGNe/jIiA+lI08KbXka4ma1nu7U/R4Bj+K4LxifsEtJdbBYck
	8ldrgqn0X2nm89hbbiWEszkbjqlDX4Ch+3DOgsVu+
X-Gm-Gg: AZuq6aLjKAFASzQv2jc2ARhdKwyE0SUDMxqXhhfapHTVwT/GEOOKfIvdygsskl3/OuC
	eJZDv9rzRL2OEDY6e9NlXQi0aNYxFcTlDbSIACos8Ss5uKvevsHEVPv0QxLmwFVtiiVLETM2UKb
	Gkz+dZWrKS5wYuaS0nNOfv7j4R445qnShJ9tlyEEtS0BQp3uu/EjZKGFBh9OBQQrS4ywXx0VS6o
	gdxOFpvsgwcoMQfEucJRo5dtgyQxX2uFYxwLdJZjfobsuPkE+kdHx+aAP3pKZBRzevu
X-Received: by 2002:a17:906:794b:b0:b73:6d56:7332 with SMTP id
 a640c23a62f3a-b8dff5288a2mr467832866b.13.1769888940424; Sat, 31 Jan 2026
 11:49:00 -0800 (PST)
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
References: <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV> <CAG2KctotL+tpHQMWWAFOQEy=3NX-7fa9YroqsjnxKmTuunJ2AQ@mail.gmail.com>
 <20260131011831.GZ3183987@ZenIV> <CAG2KctoKDsfbyopQYq3-nJBg3fG+7Nrer17S6HqQ+nCWEcHeWQ@mail.gmail.com>
 <20260131024324.GA3183987@ZenIV>
In-Reply-To: <20260131024324.GA3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Sat, 31 Jan 2026 11:48:49 -0800
X-Gm-Features: AZwV_Qix7s2zR2ubTIU666aQNHaAYNz5LepZwEs2cPS3Y4RZWye8TClZc5UBZ0c
Message-ID: <CAG2KctoJoBevAM=2F=dNnM3VUUcHX9VV-vhKDx5ydOwa4a6zUA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
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
	TAGGED_FROM(0.00)[bounces-16483-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.org.uk:email]
X-Rspamd-Queue-Id: 3409BC3B7D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 6:41=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Fri, Jan 30, 2026 at 06:09:00PM -0800, Samuel Wu wrote:
> > On Fri, Jan 30, 2026 at 5:16=E2=80=AFPM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> > >
> > > On Fri, Jan 30, 2026 at 05:05:34PM -0800, Samuel Wu wrote:
> > >
> > > > > How lovely...  Could you slap
> > > > >         WARN_ON(ret =3D=3D -EAGAIN);
> > > > > right before that
> > > > >         if (ret < 0)
> > > > >                 return ret;
> > > >
> > > > Surprisingly ret =3D=3D 0 every time, so no difference in dmesg log=
s with
> > > > this addition.
> > >
> > > What the hell?  Other than that mutex_lock(), the only change in ther=
e
> > > is the order of store to file->private_data and call of ffs_data_open=
ed();
> > > that struct file pointer is not visible to anyone at that point...
> >
> > Agree, 09e88dc22ea2 (serialize ffs_ep0_open() on ffs->mutex) in itself
> > is quite straightforward. Not familiar with this code path so just
> > speculating, but is there any interaction with previous patches (e.g.
> > refcounting)?
> >
> > > Wait, it also brings ffs_data_reset() on that transition under ffs->m=
utex...
> > > For a quick check: does
> > > git fetch git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git =
for-wsamuel2
> > > git switch --detach FETCH_HEAD
> > > demonstrate the same breakage?
> >
> > Had to adjust forward declaration of ffs_data_reset() to build, but
> > unfortunately same breakage.
>
> That really looks like a badly racy userland on top of everything else...
> I mean, it smells like userland open() from one process while another
> is in the middle of configuring that stuff getting delayed too much
> for the entire thing to work.  Bloody wonderful...
>
> OK, let's see if a variant with serialization on spinlock works - how doe=
s
> the following do on top of mainline?

Excellent, this is working consistently for me on the latest 6.19-rc7.

>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 05c6750702b6..fa467a40949d 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -59,7 +59,6 @@ static struct ffs_data *__must_check ffs_data_new(const=
 char *dev_name)
>         __attribute__((malloc));
>
>  /* Opened counter handling. */
> -static void ffs_data_opened(struct ffs_data *ffs);
>  static void ffs_data_closed(struct ffs_data *ffs);
>
>  /* Called with ffs->mutex held; take over ownership of data. */
> @@ -636,23 +635,25 @@ static ssize_t ffs_ep0_read(struct file *file, char=
 __user *buf,
>         return ret;
>  }
>
> +
> +static void ffs_data_reset(struct ffs_data *ffs);
> +
>  static int ffs_ep0_open(struct inode *inode, struct file *file)
>  {
>         struct ffs_data *ffs =3D inode->i_sb->s_fs_info;
> -       int ret;
>
> -       /* Acquire mutex */
> -       ret =3D ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> -       if (ret < 0)
> -               return ret;
> -
> -       ffs_data_opened(ffs);
> +       spin_lock_irq(&ffs->eps_lock);
>         if (ffs->state =3D=3D FFS_CLOSING) {
> -               ffs_data_closed(ffs);
> -               mutex_unlock(&ffs->mutex);
> +               spin_unlock_irq(&ffs->eps_lock);
>                 return -EBUSY;
>         }
> -       mutex_unlock(&ffs->mutex);
> +       if (!ffs->opened++ && ffs->state =3D=3D FFS_DEACTIVATED) {
> +               ffs->state =3D FFS_CLOSING;
> +               spin_unlock_irq(&ffs->eps_lock);
> +               ffs_data_reset(ffs);
> +       } else {
> +               spin_unlock_irq(&ffs->eps_lock);
> +       }
>         file->private_data =3D ffs;
>
>         return stream_open(inode, file);
> @@ -1202,15 +1203,10 @@ ffs_epfile_open(struct inode *inode, struct file =
*file)
>  {
>         struct ffs_data *ffs =3D inode->i_sb->s_fs_info;
>         struct ffs_epfile *epfile;
> -       int ret;
> -
> -       /* Acquire mutex */
> -       ret =3D ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> -       if (ret < 0)
> -               return ret;
>
> -       if (!atomic_inc_not_zero(&ffs->opened)) {
> -               mutex_unlock(&ffs->mutex);
> +       spin_lock_irq(&ffs->eps_lock);
> +       if (!ffs->opened) {
> +               spin_unlock_irq(&ffs->eps_lock);
>                 return -ENODEV;
>         }
>         /*
> @@ -1220,11 +1216,11 @@ ffs_epfile_open(struct inode *inode, struct file =
*file)
>          */
>         epfile =3D smp_load_acquire(&inode->i_private);
>         if (unlikely(ffs->state !=3D FFS_ACTIVE || !epfile)) {
> -               mutex_unlock(&ffs->mutex);
> -               ffs_data_closed(ffs);
> +               spin_unlock_irq(&ffs->eps_lock);
>                 return -ENODEV;
>         }
> -       mutex_unlock(&ffs->mutex);
> +       ffs->opened++;
> +       spin_unlock_irq(&ffs->eps_lock);
>
>         file->private_data =3D epfile;
>         return stream_open(inode, file);
> @@ -2092,8 +2088,6 @@ static int ffs_fs_init_fs_context(struct fs_context=
 *fc)
>         return 0;
>  }
>
> -static void ffs_data_reset(struct ffs_data *ffs);
> -
>  static void
>  ffs_fs_kill_sb(struct super_block *sb)
>  {
> @@ -2150,15 +2144,6 @@ static void ffs_data_get(struct ffs_data *ffs)
>         refcount_inc(&ffs->ref);
>  }
>
> -static void ffs_data_opened(struct ffs_data *ffs)
> -{
> -       if (atomic_add_return(1, &ffs->opened) =3D=3D 1 &&
> -                       ffs->state =3D=3D FFS_DEACTIVATED) {
> -               ffs->state =3D FFS_CLOSING;
> -               ffs_data_reset(ffs);
> -       }
> -}
> -
>  static void ffs_data_put(struct ffs_data *ffs)
>  {
>         if (refcount_dec_and_test(&ffs->ref)) {
> @@ -2176,28 +2161,29 @@ static void ffs_data_put(struct ffs_data *ffs)
>
>  static void ffs_data_closed(struct ffs_data *ffs)
>  {
> -       if (atomic_dec_and_test(&ffs->opened)) {
> -               if (ffs->no_disconnect) {
> -                       struct ffs_epfile *epfiles;
> -                       unsigned long flags;
> -
> -                       ffs->state =3D FFS_DEACTIVATED;
> -                       spin_lock_irqsave(&ffs->eps_lock, flags);
> -                       epfiles =3D ffs->epfiles;
> -                       ffs->epfiles =3D NULL;
> -                       spin_unlock_irqrestore(&ffs->eps_lock,
> -                                                       flags);
> -
> -                       if (epfiles)
> -                               ffs_epfiles_destroy(ffs->sb, epfiles,
> -                                                ffs->eps_count);
> -
> -                       if (ffs->setup_state =3D=3D FFS_SETUP_PENDING)
> -                               __ffs_ep0_stall(ffs);
> -               } else {
> -                       ffs->state =3D FFS_CLOSING;
> -                       ffs_data_reset(ffs);
> -               }
> +       spin_lock_irq(&ffs->eps_lock);
> +       if (--ffs->opened) {    // not the last opener?
> +               spin_unlock_irq(&ffs->eps_lock);
> +               return;
> +       }
> +       if (ffs->no_disconnect) {
> +               struct ffs_epfile *epfiles;
> +
> +               ffs->state =3D FFS_DEACTIVATED;
> +               epfiles =3D ffs->epfiles;
> +               ffs->epfiles =3D NULL;
> +               spin_unlock_irq(&ffs->eps_lock);
> +
> +               if (epfiles)
> +                       ffs_epfiles_destroy(ffs->sb, epfiles,
> +                                        ffs->eps_count);
> +
> +               if (ffs->setup_state =3D=3D FFS_SETUP_PENDING)
> +                       __ffs_ep0_stall(ffs);
> +       } else {
> +               ffs->state =3D FFS_CLOSING;
> +               spin_unlock_irq(&ffs->eps_lock);
> +               ffs_data_reset(ffs);
>         }
>  }
>
> @@ -2214,7 +2200,7 @@ static struct ffs_data *ffs_data_new(const char *de=
v_name)
>         }
>
>         refcount_set(&ffs->ref, 1);
> -       atomic_set(&ffs->opened, 0);
> +       ffs->opened =3D 0;
>         ffs->state =3D FFS_READ_DESCRIPTORS;
>         mutex_init(&ffs->mutex);
>         spin_lock_init(&ffs->eps_lock);
> @@ -2266,6 +2252,7 @@ static void ffs_data_reset(struct ffs_data *ffs)
>  {
>         ffs_data_clear(ffs);
>
> +       spin_lock_irq(&ffs->eps_lock);
>         ffs->raw_descs_data =3D NULL;
>         ffs->raw_descs =3D NULL;
>         ffs->raw_strings =3D NULL;
> @@ -2289,6 +2276,7 @@ static void ffs_data_reset(struct ffs_data *ffs)
>         ffs->ms_os_descs_ext_prop_count =3D 0;
>         ffs->ms_os_descs_ext_prop_name_len =3D 0;
>         ffs->ms_os_descs_ext_prop_data_len =3D 0;
> +       spin_unlock_irq(&ffs->eps_lock);
>  }
>
>
> @@ -3756,6 +3744,7 @@ static int ffs_func_set_alt(struct usb_function *f,
>  {
>         struct ffs_function *func =3D ffs_func_from_usb(f);
>         struct ffs_data *ffs =3D func->ffs;
> +       unsigned long flags;
>         int ret =3D 0, intf;
>
>         if (alt > MAX_ALT_SETTINGS)
> @@ -3768,12 +3757,15 @@ static int ffs_func_set_alt(struct usb_function *=
f,
>         if (ffs->func)
>                 ffs_func_eps_disable(ffs->func);
>
> +       spin_lock_irqsave(&ffs->eps_lock, flags);
>         if (ffs->state =3D=3D FFS_DEACTIVATED) {
>                 ffs->state =3D FFS_CLOSING;
> +               spin_unlock_irqrestore(&ffs->eps_lock, flags);
>                 INIT_WORK(&ffs->reset_work, ffs_reset_work);
>                 schedule_work(&ffs->reset_work);
>                 return -ENODEV;
>         }
> +       spin_unlock_irqrestore(&ffs->eps_lock, flags);
>
>         if (ffs->state !=3D FFS_ACTIVE)
>                 return -ENODEV;
> @@ -3791,16 +3783,20 @@ static void ffs_func_disable(struct usb_function =
*f)
>  {
>         struct ffs_function *func =3D ffs_func_from_usb(f);
>         struct ffs_data *ffs =3D func->ffs;
> +       unsigned long flags;
>
>         if (ffs->func)
>                 ffs_func_eps_disable(ffs->func);
>
> +       spin_lock_irqsave(&ffs->eps_lock, flags);
>         if (ffs->state =3D=3D FFS_DEACTIVATED) {
>                 ffs->state =3D FFS_CLOSING;
> +               spin_unlock_irqrestore(&ffs->eps_lock, flags);
>                 INIT_WORK(&ffs->reset_work, ffs_reset_work);
>                 schedule_work(&ffs->reset_work);
>                 return;
>         }
> +       spin_unlock_irqrestore(&ffs->eps_lock, flags);
>
>         if (ffs->state =3D=3D FFS_ACTIVE) {
>                 ffs->func =3D NULL;
> diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/func=
tion/u_fs.h
> index 4b3365f23fd7..6a80182aadd7 100644
> --- a/drivers/usb/gadget/function/u_fs.h
> +++ b/drivers/usb/gadget/function/u_fs.h
> @@ -176,7 +176,7 @@ struct ffs_data {
>         /* reference counter */
>         refcount_t                      ref;
>         /* how many files are opened (EP0 and others) */
> -       atomic_t                        opened;
> +       int                             opened;
>
>         /* EP0 state */
>         enum ffs_state                  state;

