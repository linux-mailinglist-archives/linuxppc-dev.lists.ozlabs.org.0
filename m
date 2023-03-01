Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667446A7703
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 23:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRq936nBsz3ccn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 09:46:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mtKxL1K1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=msl0000023508@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mtKxL1K1;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRZjH33mPz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 00:25:06 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536be69eadfso364124837b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exR2+TqEpSlqFevQJNeEfA94A0V1nCJq85nKX6qDaLw=;
        b=mtKxL1K1iXvX51NRMmhZlJ7hMmHivPnRS3Ube7FFi8h22uB+E0k1e9jhzPc+9TkXud
         JTuvuGrzgcaxYL1ftWBYWP5YrslTP+xc2Ti12Pwx6pVFByy9MJCrXfYOTwg6CeTyt3KD
         +CHaijY9m+p7BbBuArmtcWcCmFm7grWZ3fJWG0kRNFwHFzi5QbzgvF0rZIGQokw2kLxL
         KPoc3BKDK7HQ2cNeeGjK4Ad+hF7KXk2+ZGT7AchCOp6oPi1Ok99Snc/puoOPsNjeo4vg
         /+/rLpLxgHs9prkXTpBfF48+lVH9FHdEKLnYls6asmGaRuc8hsbbuj3mFN4tlSnSeoSm
         H/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exR2+TqEpSlqFevQJNeEfA94A0V1nCJq85nKX6qDaLw=;
        b=fkIEDlbnVEJbjYrB0cWUyO/W3Z+JlpJykC/l4km4/i0gNKFAdskFovQh6wj8YDZ/pR
         yF/ZPvxwHW6JGczqjezNAtHdTK4InRscktyS/9h1MqZSU4/HVU/oCGLyJ9GTmzZX9tJm
         BdMYn4KJI2e1qpzdGFT11flLVnXE2VU6Y19O12fQRf3TeabNVJlVU4LTPTYr+AezK+s1
         SxXnQ1+0IHV7vOP3pElFmOTd61/2k/WBDMG8s1mKKcHO1AaQHBXUSbdFXsiSPhMAhFdO
         jAowuTAokkhiF6Af4Xxt7/kj9isltaOrHYA5kklMGiXm6aN5MJu0UigtLuLOKqSAmb18
         v6XA==
X-Gm-Message-State: AO0yUKUIM7quo1VyCxbAXoOTOEjOcemkY/hdYVi9/Eu9Rn/7qSHQvKr0
	ea+jv0FnRI68RQM8WjpZuTF8bINfbWKD7UPsRy1YyyY7ssw=
X-Google-Smtp-Source: AK7set8tiqLvHhgexArZdvrmT7IyXZMyr3vtYFQq7S2W/T098k3GBbIJ05CrE41Z0ifAM355eGWBJwgY5vN7Z2GilfY=
X-Received: by 2002:a81:b65b:0:b0:53c:70c7:405b with SMTP id
 h27-20020a81b65b000000b0053c70c7405bmr1054124ywk.4.1677677102949; Wed, 01 Mar
 2023 05:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:a309:b0:480:bd65:1f87 with HTTP; Wed, 1 Mar 2023
 05:25:02 -0800 (PST)
In-Reply-To: <CAPge7yekNA633CiWbCftS5GRHTzYAMeraOmKKSMZL=5GdWzqfw@mail.gmail.com>
References: <CAPge7ycxEpms_wQoDoCncz743N2BfzVCZPLmbHCVTs6ZKSp=nA@mail.gmail.com>
 <Y/27PBzfeRNEhWnA@kroah.com> <CAPge7yekNA633CiWbCftS5GRHTzYAMeraOmKKSMZL=5GdWzqfw@mail.gmail.com>
From: =?UTF-8?B?546L5piK54S2?= <msl0000023508@gmail.com>
Date: Wed, 1 Mar 2023 21:25:02 +0800
Message-ID: <CAPge7ydHNFbnxT2SJYfvJAeb9K2uyG0ynTWwii74X0Tv27HADw@mail.gmail.com>
Subject: Fwd: Symbol cpu_feature_keys should be exported to all modules on powerpc
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Mar 2023 09:45:46 +1100
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
Cc: Kevin Hao <haokexin@gmail.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

---------- Forwarded message ----------
From: =E7=8E=8B=E6=98=8A=E7=84=B6 <msl0000023508@gmail.com>
Date: Tue, 28 Feb 2023 18:16:14 +0800
Subject: Re: Symbol cpu_feature_keys should be exported to all modules
on powerpc
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org

2023-02-28 16:28 GMT+08:00, Greg KH <gregkh@linuxfoundation.org>:
> On Tue, Feb 28, 2023 at 04:18:12PM +0800, =E7=8E=8B=E6=98=8A=E7=84=B6 wro=
te:
>> Just like symbol 'mmu_feature_keys'[1], 'cpu_feature_keys' was reference=
d
>> indirectly by many inline functions; any GPL-incompatible modules using
>> such
>> a function will be potentially broken due to 'cpu_feature_keys' being
>> exported as GPL-only.
>>
>> For example it still breaks ZFS, see
>> https://github.com/openzfs/zfs/issues/14545
>>
>> [1]:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220329085709.4=
132729-1-haokexin@gmail.com/
>
> External modules are always on their own, sorry.  Especially ones that
> are not released under the GPL.
>
> good luck!
>
> greg k-h
>

Some inline functions are just powerpc implementation of some generic KPIs,
such as flush_dcache_page, which indirectly references 'cpu_feature_keys' i=
n
powerpc-specific code; this essentially makes 'flush_dcache_page' GPL-only =
in
Linux powerpc, but not in other architectures.
