Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED986CC4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:03:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFUna/1S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlvcb3yQhz3vZw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFUna/1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlvbt2jsKz3dXG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 02:03:05 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56693f0d235so10351a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709218979; x=1709823779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Xt7r0iy2ZKjZiKFpfmpzIBkzlUZzfD5jbJ2OWHmQhQ=;
        b=kFUna/1SxJZzdedFJX+D2YbSq/LIEd1QSr5cPUWbLeYZlMFP4+bSYOYFu/EiCDGfLf
         DK09hR7AdSYqWQb7iCaz/eOePIEdsippBBsDgSgJHVQzwyAO/1FJV3w1UvUCZv3nnnp2
         tsBXeMRZGVrqJqS6qK0PtObi40HO83ELaIZREhZrgM1aLwpzGZVVY4on33wiMUCZV6S9
         mMcQpr21CXaVwLctBU+Nasu3ZTMx3LWMI3rinKJujKmcrdZ9MV2uE4R+zegQSq1yoaR6
         AbuS9yY8jbiJUbXR0NMIBJ9CQdbXCB2AArneSjLOXy5XeohfOSP30olIaYGGMrDXXClc
         oqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709218979; x=1709823779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Xt7r0iy2ZKjZiKFpfmpzIBkzlUZzfD5jbJ2OWHmQhQ=;
        b=ki58e7SLysa7Qd29BF9aa9RfttgLFpldhl+DNiA2FbZeFHs3mTohE9hemMquTFliMa
         yNh4dzMLtAgXSoWT/zZoTKV4SSc1hRdPr2DLt+ZKPfEn7weHYCzDf0IXIUctmTkg0MVx
         KHnIsfFmOgU86+YEutvsRIbytaiMUqKBpD8dp9tl8oY3/r8ZTBVH42DYV8s7S37TE6aT
         qpkeCYCoBth9nDO8B+93xs8KSVE2Oenqxz0W6YPnQEdOARr2IQ8V8/5WyOs5pcgTbYtY
         R0mJU1Iye88uydrhDyqNUTayM6n5CTcyfl/H1bhU9RPZ0YjALVI4y0uARh5D4eP6dv9K
         TrJA==
X-Forwarded-Encrypted: i=1; AJvYcCWDVgPA7iaYnfkQkuQbZ5S71W+0iBpfG5GN3O26UMlctlpQQ5W+4V9Vpehm3actokrGLqyeLV+OqwbrdggUslSCtYUwWfwajiJbXhyRqg==
X-Gm-Message-State: AOJu0Yzcdd7jBrohF06zNIYGa4ZXmVCdsX5Nj2cv6Kdm6OQqVo/CR9sR
	uJwe06I+sHQHLwwQEvwN2gC8e+ZBEgxw0m47D1BwPKZL8ddI8DHXRA/Z7Ho/9e9pArVpOrvak58
	ezNT+strUjaT47D707ABLGZfdc7wzjWmQNbCM
X-Google-Smtp-Source: AGHT+IHKKvFohCmsqwznChrSRNtAgrRFA9gi2zMoaC1rwF8TzuG0km2vSc+rjeIkq6wfRbw6opIJuwOoddvxCCvQ8EI=
X-Received: by 2002:a05:6402:34cc:b0:565:d0e4:d8a0 with SMTP id
 w12-20020a05640234cc00b00565d0e4d8a0mr131215edc.3.1709218978541; Thu, 29 Feb
 2024 07:02:58 -0800 (PST)
MIME-Version: 1.0
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev> <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
 <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com> <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
 <20240229064742.36c2f476@kernel.org> <CANn89i+4Q2L7Gd5zGrSwT_v2wjL-ZKEFcM=oQ9w090+xc57HTQ@mail.gmail.com>
In-Reply-To: <CANn89i+4Q2L7Gd5zGrSwT_v2wjL-ZKEFcM=oQ9w090+xc57HTQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 29 Feb 2024 16:02:47 +0100
Message-ID: <CANn89i+xNW5Dg2UgHWPdoqW8Cq9a+KVV2TJCbGqrt1StZx0b=Q@mail.gmail.com>
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: venkat88@linux.vnet.ibm.com, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 3:53=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Thu, Feb 29, 2024 at 3:47=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Thu, 29 Feb 2024 09:55:22 +0100 Eric Dumazet wrote:
> > > I do not see other solution than this, otherwise we have to add more
> > > pollution to include/linux/netdevice.h
> >
> > Right :(
> >
> > > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > > index a9c973b92294bb110cf3cd336485972127b01b58..40797ea80bc6273cae6b7=
773d0a3e47459a72150
> > > 100644
> > > --- a/include/linux/netdevice.h
> > > +++ b/include/linux/netdevice.h
> > > @@ -2469,7 +2469,7 @@ struct net_device {
> > >         struct devlink_port     *devlink_port;
> > >
> > >  #if IS_ENABLED(CONFIG_DPLL)
> > > -       struct dpll_pin __rcu   *dpll_pin;
> > > +       void __rcu *dpll_pin;
> > >  #endif
> >
> > If DPLL wants to hide its type definitions the helpers must live
> > in dpll? IOW move netdev_dpll_pin() to drivers/dpll/dpll_core.c
>
> Oh for some reason I thought this stuff was a module.
>
> Otherwise, why having dpll 'core' helpers in net/core/dev.c

So, we would have something a bit convoluted like :

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 4c2bb27c99fe4e517b0d92c4ae3db83a679c7d11..241db366b2c74ae749f49612d86=
176b2f8f479c1
100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -42,6 +42,11 @@ struct dpll_pin_registration {
        void *priv;
 };

+struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
+{
+       return rcu_dereference_rtnl(dev->dpll_pin);
+}
+
 struct dpll_device *dpll_device_get_by_id(int id)
 {
        if (xa_get_mark(&dpll_device_xa, id, DPLL_REGISTERED))
diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 4ec2fe9caf5a3f284afd0cfe4fc7c2bf42cbbc60..c60591308ae80fb99aa5abb5832=
b9a228473a916
100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -169,13 +169,13 @@ int dpll_device_change_ntf(struct dpll_device *dpll);

 int dpll_pin_change_ntf(struct dpll_pin *pin);

+#if !IS_ENABLED(CONFIG_DPLL)
 static inline struct dpll_pin *netdev_dpll_pin(const struct net_device *de=
v)
 {
-#if IS_ENABLED(CONFIG_DPLL)
-       return rcu_dereference_rtnl(dev->dpll_pin);
-#else
        return NULL;
-#endif
 }
+#else
+struct dpll_pin *netdev_dpll_pin(const struct net_device *dev);
+#endif

 #endif
