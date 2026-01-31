Return-Path: <linuxppc-dev+bounces-16479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMBuBFRkfWmtRwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 03:09:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2EC0386
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 03:09:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2xC22rmVz2yDY;
	Sat, 31 Jan 2026 13:09:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769825358;
	cv=pass; b=IRPwRhf7NnCebBjEEWrwHTmnZ7TAckvxf0Cf1U7Syb3ld8fhrPqefZr53kp+bGQahxL7ZYePVbl7OjeiMlLugLAIGPsROlum23IDIsZ/pmh2RPjPuvetNATuFva5nzje2z6kA5yWaa3KtSU6R7HU2+lm0LxTMTQQABHVSMuzxryNrwmdy7wBnj6r+fpATz40g4sw/XvnjCYOxFLr8QDroYqdCN3LcCXs5h3bt/Edg/eY7a4Wo1wzNFRC4D3n1T7nnVii7huRXIJXdwizkXGs5Cj6fWNvMCnNB3oSxB/JnMFxk+NYOCTXg+lEd6HMJeLtfrnOySAwEFuGxnU95fumIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769825358; c=relaxed/relaxed;
	bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak1rW5pkNw++q2vtJanYehoQKFICMeMbuI0YEDLkzpjrVByyrW2hBYdmeqwVBbSKcNUDoArXa6fASOcuiEtMfaWMjbHm8q7K/7hjRZLa+GCSGCa4QfTM+mMh0u4o+Fpq9z0v2ujHx91srA7Jo8IPI6zGwh73kRYEqdyEBOJZq/fuE0QteS58YpE+6JhOJEYduxrvxHb0Xi356czQjgaGv3oPv1KQsHL9FjL0I+ZHjMNMnFA5fS4d83JNs4TRMCPPAnzhZDO9PRUJL/2x4Eyy4wRJ3tTYxH1PxgzzWti2wq1+SfDNK+7scdiqCCuPb5FNCUMZGD+09bwacxgS9IkaBw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LEFTxVp3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LEFTxVp3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2xBz6z0mz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 13:09:15 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b884ad1026cso433893066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769825352; cv=none;
        d=google.com; s=arc-20240605;
        b=O7VcL8AeZ1Qr8QAzE6e5AfcRVOSqsjTsC3Y7L5QEsnCeiBQghzclPLsdax0gOMKGvc
         1x/fPIiwpHWnHw5oc/0Ve+YZEgUfYNP1hMHN/pBdncIyiK2AxUE/UvmFYxe2IjPxS2Ck
         4O/EoeJ14n1/AEJ19ctpe1B2HnpMDd+6XM8ODkniCc4aVxBxRdFS91iz1OA9HtHa6oiz
         HslOjz6eYCUiSd/rufIC16sqt/cpf69fdTiqZvVxNZ8lDXfuSVXxaAbOETCibM9Go60i
         jqLdhIholDriqskh7HGIOmREhdUNEuxvE+9RlWY4o9e1J1nHA9o0DhFxFrj1nets7bvD
         EGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        fh=idGPpH4smqCAI2227iBSZEXoCZhDl23So0UnnQ9jA/E=;
        b=SbT9X03e2o+eDYKKBJ0+LLvyoHurfhjTq0oXE4DcR1x07EJGaMBmO3Pe93UT6vkuzJ
         hNt0nj5HxbynxoF9OHXNojiqQB0MdxTDzHGbega0hfxReH8joYNSOE0t9vzGdq5J3cN/
         tnHnpiCDO0XDnlNa4R6RQ57/1Jd5y6S0FBlQimb5yxh1FYnlwqsUC+H/2UT0i3MBoEIv
         aqNrqq9MK+xfMiRFqEw5+at4b8FQh3BFPeh0slzqQjLyKOfvR0ezPEEyoBwc/SsK1iYF
         Jp9u/pZ8ED/0mC9Byi3gAZwQIeyLzibIiiqpR5mpFyYsIyIVVe0UqQiYQuj/mnlgKDE+
         bMcw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769825352; x=1770430152; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        b=LEFTxVp3aCh+Sv7z55iokqKUqqk4He1/45g8A3py6F/0Oiol9O+TmwXNA2q/w521PP
         5YhDya8aVRPvuuY2YjQ1SE3i8TSbz7yxakVsmQMKaYrLcjfBdqszBSpoqSxG3uYGQ7jm
         Us5v44eDUdMan6as0Cl76eYNjs7WsKBfIXE4kTb4OSTPay4pZOSFvw4CVmxVFWRS6dFW
         cJy0EylW/L3/Oz8BZSt3w4lQJXjmmR5VhUDXlQv6valpPeWnJsVjxExc7Z8ZpGwCXN9V
         OTwbCflWmWrgvgIWGsnq/bsrXLYfnyqW+5CJ+aN+7bTjwNp7dPbPRGVUAGjxNB09DlCK
         l8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769825352; x=1770430152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        b=dLuhvS8wjRZ/qvMeS7nRASLEBpwktlcxwMbtxngi1BnB0CIfbuJffG1Ok6cCdoADN7
         GIDZ7Mc2C9+8mOrFLUIDu4Imtw5uS9AwbL6dZquOUgygWUGQM6O+HVgbjq6Z6wfvZGRy
         9ZPnBh+4P8KnDnHs0BE0aRlUAjk7EOjq1LxJvG9y6t7ebeCaeVRIrAWH7jwM7VapZibB
         BEeF8y+KxUSEZiAtDEUD39wKteysEED3YT6snPSktOPGHFBjE+Qvzj8/dL4zbv/FDSUE
         H9HoV+gIfr7bvfvrj3NrqgIqKOAMvlIhfSMJp6CPqWd9wlVyCxPEmQC+07ykLrq2huLw
         gyLA==
X-Forwarded-Encrypted: i=1; AJvYcCVPqu50UAdZIid4RI74uKJb+5WOTTWFaIgYBNMT/AjanoTke/wC3FodduNSlvDfCpzwIs/C6mj6G5hMdY0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrjPiqQ9luHDtHuYfYWEl8f5VJHrc5S/DdNUTMQtOVaMF0r4Wx
	bMq7zN8exr0jSDMXtUALSsF7uJlITiB5FFAYC0O0VDau4hIqnK+xk6KGY1HHhq5AUTn0tC3iU7H
	Auc85YGtKSi+0TEIxWH6JKLwE2lro8QxQ4sL6IHkE
X-Gm-Gg: AZuq6aKV30YsWg//Uaw/kyGXPjw5ONi3T7iyRXE4a+B2Zjm/f9hUVteqauXnuW47+OR
	qZ2zjvDD9Rg8BoH09UcZyYYuKowzJk+AeNWTCFZKjCVAJutlsXpl+NoaJHAFVIhMPhUowauHQ0M
	655cVTox2bQM21wQS79TQPVofNWiaFUsR7YxQIkS6Zey1HoSaug0ZGnBGYLAhTF/vn171GTtNaa
	GYUtnvj/yEcIP8OGOFZuCDWmkLztUB+Fesfac7hQPTOqZhW6FaihaZlCywGZEbbR9PCBO3lNtcS
	K0o=
X-Received: by 2002:a17:906:f5a8:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8dff5d84a1mr304116566b.28.1769825351931; Fri, 30 Jan 2026
 18:09:11 -0800 (PST)
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
References: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV> <CAG2KctotL+tpHQMWWAFOQEy=3NX-7fa9YroqsjnxKmTuunJ2AQ@mail.gmail.com>
 <20260131011831.GZ3183987@ZenIV>
In-Reply-To: <20260131011831.GZ3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 18:09:00 -0800
X-Gm-Features: AZwV_QgpcNm32QTyYTJNZ2e8MpZD_azq4tiS_evKebHi_xWHPJAAyFUDpR04HdE
Message-ID: <CAG2KctoKDsfbyopQYq3-nJBg3fG+7Nrer17S6HqQ+nCWEcHeWQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-16479-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email]
X-Rspamd-Queue-Id: 78A2EC0386
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 5:16=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Fri, Jan 30, 2026 at 05:05:34PM -0800, Samuel Wu wrote:
>
> > > How lovely...  Could you slap
> > >         WARN_ON(ret =3D=3D -EAGAIN);
> > > right before that
> > >         if (ret < 0)
> > >                 return ret;
> >
> > Surprisingly ret =3D=3D 0 every time, so no difference in dmesg logs wi=
th
> > this addition.
>
> What the hell?  Other than that mutex_lock(), the only change in there
> is the order of store to file->private_data and call of ffs_data_opened()=
;
> that struct file pointer is not visible to anyone at that point...

Agree, 09e88dc22ea2 (serialize ffs_ep0_open() on ffs->mutex) in itself
is quite straightforward. Not familiar with this code path so just
speculating, but is there any interaction with previous patches (e.g.
refcounting)?

> Wait, it also brings ffs_data_reset() on that transition under ffs->mutex=
...
> For a quick check: does
> git fetch git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-=
wsamuel2
> git switch --detach FETCH_HEAD
> demonstrate the same breakage?

Had to adjust forward declaration of ffs_data_reset() to build, but
unfortunately same breakage.

