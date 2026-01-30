Return-Path: <linuxppc-dev+bounces-16471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNAWMrw4fWlMQwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:03:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCEBF4E2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2s4T4XW0z2yFm;
	Sat, 31 Jan 2026 10:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769812337;
	cv=pass; b=odKi2ZXxhVtIcWdT8zxRTWn6iyjG737OcWSryX4z9AO+ax2ud2fz3r4yNLn+qgmIjpbZjQ95QziqYYvYX9CHqtoap9UTuSm354g2te+4yxt0WPmeGb8EiDkYh3Bbo2ea8J5U0uWFlw4SozKICONH80fn2+UjBXJB8SQ/BZ1YACs7G+yziPfQj3GZtu8HxyIUfDPvZzWRYPJO4JdVMdm7QD/tMkS9OAEGdm/XsPrfCyVQepab+oCEEn2fE665l8hI9Hxg4UW42nO0cp8c5ouPsCTXkOmpiLsf4dB0W6jlUiqbuere90mpw7z6w4Cy4w9aYCnASExOrSvMz18GfzTuWA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769812337; c=relaxed/relaxed;
	bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkEKTRlnvP/jQKVogFu4Ma/XVx5IcpKwblDXSKxVK+daQjbEFvKMraCbvD9UEpPde0BwlTK8LOocmZN+xqjE+2QM6zE5q4X4XnvnglkDeicsRdvnR1dWqYCtRie2nvqwMD1cp232a4jVqFumwTg/iNZw0BIht6zaDsscS1mZSsige25Lf++QSNEn/X2sHyXlK40DxDWUDsxtIOMo8Akpk1CrXjiS1idgzeYdFt8PjF3NRf2W50eWbiF3Uvm67hPflfmeS/rEBb5SlCJIHLbcXvnrwVbR0QiHSdU+kEIky9lX7zXHH5A+WHr6h+gjpwRgGvJ81mWZu1jCiaYn+ezyiA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fukiJeKc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fukiJeKc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2rNZ6Gcfz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 09:32:14 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b8850aa5b56so415300566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 14:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769812326; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8Uv4ipffI0M04Qg24L5zOxGlNYJsMo4uqnHrUWzbMqiQHWmlGQY4h9CnMD4w6lfQv
         ImoZT7RUfsfBGvLOs5mBASUj6Z0VjuKAhRdAvrhrFuEvpoNKGCVv3yaUbXmz1N1VGV+/
         unYUiqYndKZBYynn9fQ5dHycbfHJNguy265Ht2KNSh8256H4kWA6WngW8S1Utbi5vY40
         3IlzzuNq7j3FwYyW30rM3VFmlu5t/0biFUagrEtasz2wDtURZY0B0OBV2uNsGzGQzq+u
         GvNXm3YWYssFh906NUwg/8uh4lbIrGqb8ZARex4MLG6JdEyXD5GOhANRl+I2TMchJ85n
         W1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        fh=WeyKbPImCmJYJ6RaoiCE+HoMPJ6h/NSa28Fe1mi84jw=;
        b=FnITF09RaEEGuAJMif8HbUBcZb3Nx5PjTlkuJTNPFHvdfzCkXWMAMaN1wx89pM2txk
         Y5r+IlcOQ6LDdWkIN8N8D3aiBwR3OtI0zjemRzZIBTWo4cji7DsHAwtrgzZo4c9Kh9bA
         CooyG7boGWKGZqsWFuh21bactvrj7vZ/CahRwqxm261pIaA9ihBeOMadcxuYB7ZX7iT+
         jokTLwJD+egMrZFUWIWK79Yh4/9GTPY/r9cmLwKx/UtnopYFfGZ/N3YNNv0uWhHw0/cc
         5Jipi97sxFxGoVMr1hnbW+8m0/YfoIJQbeqbWkPYJncoheDy0NC7pYIXbbUulqybrAJi
         IthQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769812326; x=1770417126; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        b=fukiJeKcWnRvtpEoZcMw97Bkv714fk0p7HudMODY+YNJ9y0spQ5lTj7UBSp25qGD3M
         02ZFpCVmW/s9azaej+79WF52/5LKFoaFkvHwAPy09iNMJJNZmnWk0XTmYIbZHOvYCOYM
         3HefpGt3Yrsx83kDm1hwX1xp5ryPFX4v6RfG0bojFF1Dg2OoZ5PrqdgTO2h4fWxtOBwN
         5TWCToxqa+BpKu1HyiZXsgtCdTRXZQ1hIZu9bzXFJo+yO655OMIQhQyEphFA37bZsysm
         T0tI7CIzOzPoRS0mUblxhjMwSFbgiOfuXqglphs4S/UQnSrvfEn8ih3ncmwf1iam9ZtC
         JBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769812326; x=1770417126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        b=E/ghttm5Jiwb81LSaA5mnyO9q723aM72NfPs+twlmFSZRY3UF7udN3bH/7HHNtXlip
         ajNkWKYwVA7BZh9swcpQctrz+S5rKYMTQYBrgza8KWykMBnKoDt2FS7K7tfIdG5PBpMU
         ztkWo3MZTqZJ+Z0glmaI/EffiBw1ycT3XC29l/XKDaGZC+kAWjBrXWHuyGIyWVy2olFk
         ZRDzW9PMLp1xXyGKRYm5Humqj12kQyspKoqGr+jj2YH3bXVoGJTeNP7/ww1QwPqzjD8Q
         9GbdUZ6RNix3yoEXzlG+gFSj88S2AQVwXZ4ToqSHH22AdV+r/aWIoSj5m6r0ctP9ggQs
         LOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYn/SBtpuetxJ/k6rqSKBwq0YBKh9x9NGCpQIQfVdTMlmVBN4R3HutOAqtTuIlHAF6PlDVLWdzzYu6/Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFLuLU1bmGBCzvtSjIZ51+/eoKwFQgrlD2jgLiSJFlYrMQf2NT
	P68mvj3qcI8FE+SvtilN+NtAUCTns9csFCWvr7z8S2C0kzX7HjepdlvkF+nI44LE5gjtKl8/z7O
	VU4yzfR/wrjfp8/uRxfHHS21NwpdfgdKPZEojO2mn
X-Gm-Gg: AZuq6aJyyJeoxPTQgVA+cK3vmqrAlwBUOBW4CLyMFO0OV/5TM4IjEB8fQEGqWdrtIJq
	H+d0qFvAJs+hLPGVCeRcipisA5KC9KStD1N/mwod7pgnT7pf/lUC4+EvvRwmNRKY/6MccRxAhLO
	/OJ69LLA5AweqdZrrmuqZ7AvzhmT2eURDxNOVHs+OZUCkfgEV661pYMTL4xLcFi0sYmWSF3Fgi1
	t25qkke2P4TJ3d1i6HE5lEylpvubEzRr0++LiLw3RF61NMsbC2JL/ZzAZtIXmDElDlk
X-Received: by 2002:a17:907:e0d8:b0:b8e:14cc:9197 with SMTP id
 a640c23a62f3a-b8e14cca990mr91520566b.15.1769812325869; Fri, 30 Jan 2026
 14:32:05 -0800 (PST)
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
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com> <20260130070424.GV3183987@ZenIV>
In-Reply-To: <20260130070424.GV3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 14:31:54 -0800
X-Gm-Features: AZwV_QjYrhpLENkXIfDxcZ9u-zvP7f57lE4mcVebqUxFVKgl6ULvCT7XG0RHQoc
Message-ID: <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
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
	TAGGED_FROM(0.00)[bounces-16471-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E4BCEBF4E2
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:02=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
> OK.  Could you take a clone of mainline repository and in there run
> ; git fetch git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git f=
or-wsamuel:for-wsamuel
> then
> ; git diff for-wsamuel e5bf5ee26663
> to verify that for-wsamuel is identical to tree you've seen breakage on
> ; git diff for-wsamuel-base 1544775687f0
> to verify that for-wsamuel-base is the tree where the breakage did not re=
produce
> Then bisect from for-wsamuel-base to for-wsamuel.
>
> Basically, that's the offending commit split into steps; let's try to fig=
ure
> out what causes the breakage with better resolution...

Confirming that bisect points to this patch: 09e88dc22ea2 (serialize
ffs_ep0_open() on ffs->mutex)

