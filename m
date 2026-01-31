Return-Path: <linuxppc-dev+bounces-16484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIHxNv9ffmmPXwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 21:03:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF2C3CC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 21:03:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3P243QD7z2xm3;
	Sun, 01 Feb 2026 07:03:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769889788;
	cv=pass; b=oIoGGUDdZ4YMjb5if4Y+K+V2450dSs2ReuTuWVDRdrpxajU/8JqTEmQ3p276zWOz3zzVivzVVtJIlXNvR5rJhFFQoYZM9NeYg45FJPZsptvY0eY362zFKsV0sFN5xx5wUnEAt80AgxuPnbtiZmX36VCv3IppcIOkljRw5yiSRKtAJTyqooZVuPs0PPTGozLVWTJanHHJU031HE0B1GU6gx9aE2ui7On2dWUmpOKSgwTtF3znKl8xwzlcvhvkXcwEnruVezfG78MSzYIUBUSPBA9vnT6o82n6+H1oP+2umKSm740oxMxNEaLqMj/5Q1E9wd7qEPhiDnZY02tGvo/VsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769889788; c=relaxed/relaxed;
	bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUzbQK3oEPRuUSIsziJe+IOBjQeT9KziMm6vYpRb/1FpKuD2NIr16gGfKk8Bf8KW0lXgflhqwe2eY8hPD2RTlygrSri6Td4IlcT2XNbpUcvPHDlHIIwt25gYTtbIUcrQDbu9wQTzOCajyFiApd9SjCoqBwtAguUOfLvWGl+02tNCxH63nJBti39WQtaVy57FLKY74hddnjrWiWkbgXYR5UMrhCIL61Tfbqz9qKRez5bE8S9ADoGXK4Pz7XPKMFI7Q2mcsbkE4DzlyawsdfGtgoqmHAZ0+1ooLHCYNtjbld81qJS7nys8oQ+gQbpo3JRBKPtUz5rSKjIr+xRlQUBHFA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z9dfrzpd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z9dfrzpd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3P2314xyz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Feb 2026 07:03:06 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b88593aa4dcso454808766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 12:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769889783; cv=none;
        d=google.com; s=arc-20240605;
        b=EaelkTRo5IT52RKa7mZHnBmmq+DT9apcmcd3et7DMaf82tsTyras38f1NvQOaz2mrf
         Q78mh0Yj9f+j98Pf+/51Bka6bQE26AmofzYET8heTpPvqmfYxC5JrSdg1hr393pL3nmg
         694MkZEN2FOe6tJ2m3BjS0tOjHp1LrMrKIS5b/lfXlKcPjnZ0rymBkYuObnCNdkDcOmf
         dzFLt/IYYFgNUIff5iT5UwGvYzalR/l4UlkZJ9EHAJkFtmbACNOxZl/S9FZ0E+kf6uyb
         lT17ruPOCCy+fgeiSRl3G0zVmFUQHcmXFVxY3moiFs0bWiJhn9WG0eKUT40hXNEbep5H
         rX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        fh=Cyi3MqGyGF4yFaKpOSouByokDfnoHWCUbw0GV3A8k18=;
        b=aTSwVPC9adyEJoc3K73/j40rH5gK/1cLmYkA9SGQjEgcVqag/Nlxdr//arYlTcQ1pS
         fHDgGV4yCMxOr5LeBaLIXx/QPazM2lcGuHJxUPhY2I1RQ0/2wUf4Xc6OLUMjduJ9AhJo
         BuJ/3yR/47F9wf3UUCHBC22qMIxxRBe3bc131XxGIhLJfJWEPNzV71iJPwPHdsukiQsQ
         VH6ZBQXsYX/R4evjFvgE4IcqQFliA9VRgRrVHz/b6NbLY7R4pX0Y1isvasKcau1F8R9W
         hnah5SKp7QZISOw9hPEDSp6GlMFVFv1B3pTmKwYWbH4tbBhcn+9Gy07AGcXaPgFw3Kxn
         pwQQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889783; x=1770494583; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        b=z9dfrzpdfI3kkEhu1ABjQTBUCvrldYE/x2TagAQyWWFt4uodzDK2EAVFvP/xiLz/Ie
         D9OO3KhaMm9d8rT//d+VadAX74yKaApOB7iYZs186+PlTqsD/y7HEV1Ggzno/ZK02N5P
         Ja31HqMPChjva+tmop6VfCUVpL7r574OGS16L3M+f8KwkACQl511QsJwM9F6Xt7kKxMv
         XQZpVezlFc3pVolidBIRl/pRPfKQzJoCeoLJ+cwRmbHB7rplQ5f8DOdBACBQiSs68wOX
         Mi/xuiprzjOmKC/n8i9u71wCp0DVM0+HycnbqSW6GmNxNynTO3aZ4tYljvQFS/8ffgsA
         HSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889783; x=1770494583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        b=D4JZyQHYFOsKYDWQhy8X9YiFWedNJlhM5cpgACkKIxGrrx5VQdnmsBNKbf694CbuTq
         LLdkQGK9Al8VVnP/WVxkekdCTE469O4A+PIfwWaoN2m8lyuAPBaGwwlzmoOEhj/AstUf
         QVDtIJYZFseYjgCTMI9WckmTuCoJuMK5H3JlAErORiqd7dHyFOBzrdfn1jfVZ5nGx7kh
         /a8hZZHxjl8z7TBSN50ec/dhA7/8ObVhPpPjQsTyGjfNw6FHtdT9NuDFrPJQBnhC/7nV
         Ni3cpxG1nSXLhOZadYL32g5KAiUjcDmj1o/mw4ExYlM8hktJ331Zsswe9tK5CdpOrz5H
         m10g==
X-Forwarded-Encrypted: i=1; AJvYcCXGU2pOvsjwnC6cFKdk593qJuohpVG28zkb5pJVi4MthMnzv1RPN7oKVOJNsMcH1NPABhxzC60Rzi8NjME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yym35Wn+STwv48bHK7q46K2eY81Wiw91qVfAAs3AWjMNmhRs6SV
	yOTN3dsWs9/Wxelq/tVjBC+I6b7P/s/YPSMWth8EM7r0dsDYt50AqhiyQyQ3SDK+Z2VHHvZhjxU
	f7uAemNdr3k0pEqfEp8lsnr8wZ2V8uJ/jS2NZN0QI
X-Gm-Gg: AZuq6aJWaFMn/EMWU/nIZksDP8/re32nKt5yT3KwnAYeS7lq9cD9rScWT2T3Fs5gfFY
	mZqKfq6xgNrz7y5uRJ7nB+I+5ngOXXccJrJR5uP5PP9IRLy4JmMfFTJntRTVPPzGtw9UvI0I1rz
	Z9X71cCto2fd+zJALW/be+Pj7RRXwJmpPfJa2/N03tWjUkuwwrzusoZ8EMsrH3hmPRpb9dn3d4L
	XR/ub5PH5aFkOoSe6tmCFkZDUBzyJ4+KO4ISfIJzBAS88eZ4sCvAVBNARvzJLET/Xtb
X-Received: by 2002:a17:906:d555:b0:b87:2675:9eaa with SMTP id
 a640c23a62f3a-b8dff56a89dmr396045166b.15.1769889782950; Sat, 31 Jan 2026
 12:03:02 -0800 (PST)
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
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com> <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
In-Reply-To: <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Sat, 31 Jan 2026 12:02:51 -0800
X-Gm-Features: AZwV_QhcEbOb_GQTelufeNwJJCU6MsAWKA6Gjz0fMmR9BpLj1Kmi7hMzQGebBBY
Message-ID: <CAG2KctoHRG+4J0ujC9162n-Ndgn3nKMu_s5jh0-c-B_P6EOk6Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:viro@zeniv.linux.org.uk,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-16484-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 01CF2C3CC2
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 6:58=E2=80=AFAM Krishna Kurapati PSSNV
<krishna.kurapati@oss.qualcomm.com> wrote:
>
> On Fri, Jan 30, 2026 at 6:46=E2=80=AFAM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> >
>
> [...]
>
> > I'm exploring a few other paths, but not having USB access makes
> > traditional tools a bit difficult. One thing I'm rechecking and is
> > worth mentioning is the lockdep below: it's been present for quite
> > some time now, but I'm not sure if it would have some undesired
> > interaction with your patch.
> >
> > [ BUG: Invalid wait context ]
> > 6.18.0-rc5-mainline-maybe-dirty-4k
> > -----------------------------
> > irq/360-dwc3/352 is trying to lock:
> > ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
> > __power_supply_set_property+0x40/0x180
> > other info that might help us debug this:
> > context-{4:4}
> > 1 lock held by irq/360-dwc3/352:
> >  #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
> > configfs_composite_suspend+0x28/0x68
> > Call trace:
> >  show_stack+0x18/0x28 (C)
> >  __dump_stack+0x28/0x3c
> >  dump_stack_lvl+0xac/0xf0
> >  dump_stack+0x18/0x3c
> >  __lock_acquire+0x794/0x2bec
> >  lock_acquire+0x148/0x2cc
> >  down_read+0x3c/0x194
> >  __power_supply_set_property+0x40/0x180
> >  power_supply_set_property+0x14/0x20
> >  dwc3_gadget_vbus_draw+0x8c/0xcc
> >  usb_gadget_vbus_draw+0x48/0x130
> >  composite_suspend+0xcc/0xe4
> >  configfs_composite_suspend+0x44/0x68
> >  dwc3_thread_interrupt+0x8f8/0xc88
> >  irq_thread_fn+0x48/0xa8
> >  irq_thread+0x150/0x31c
> >  kthread+0x150/0x280
> >  ret_from_fork+0x10/0x20
> >
>
> Hi Samuel,
>
>  Not sure if it helps, but Prashanth recently pushed a patch to
> address this vbus_draw kernel panic:
>  https://lore.kernel.org/all/20260129111403.3081730-1-prashanth.k@oss.qua=
lcomm.com/
>
>  Can you check if it fixes the above crash in vbus_draw.
>
> Regards,
> Krishna,

Tested above patch, and it didn't fix the device enumerating on
lsusb/ADB issue. Seems like usb dwc3 lockdep was a red herring.

I'll respond on that thread with what I'm observing.

