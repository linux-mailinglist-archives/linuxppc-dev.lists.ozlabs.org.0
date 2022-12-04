Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5E641CD3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 13:11:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ5Bg205Tz3bgT
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 23:11:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Bt3t+pCv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DxeCgNBV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Bt3t+pCv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DxeCgNBV;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ59d41d1z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 23:10:44 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 284E55C00FF;
	Sun,  4 Dec 2022 07:10:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 04 Dec 2022 07:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670155840; x=1670242240; bh=CoGojBldvp
	8vts1WXDufl3QTeeG6RrXZWoBhB7qP5HI=; b=Bt3t+pCvXTostL74alusXgNN2I
	oLhoOcA34WlUK1HpM8zYrIq09NT6vJeDNBj/QdZnjHPCSY+ZUy+12uImKcNpjSPM
	o0Qr+CIcrehvro9ebDcKpmBO8KNVO0BSLyVsZqv9jkmom0XPxGpvLeiycBhyso/8
	pWUyCCDG5sY1PPjQhiPvm7NU5068KCV9X/PWB2P1GHq+0C96bygXAKrn+V5Ukhl7
	s7lNWObcsg2gwh4/61eV3/1UOs8rIoQb6FB3dYEy/Ck7h0skHoTgrMXUYD92caiH
	LVymfXQoewwpqSKzAiqVC6quJzrOTZYuY02ME7g19RNKqeqgpVhO3za9ITpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670155840; x=1670242240; bh=CoGojBldvp8vts1WXDufl3QTeeG6
	RrXZWoBhB7qP5HI=; b=DxeCgNBVAAMM2gNNTDGahzTQIA8E/3lkh9laTq8iI5JI
	oocBov/dRgohjG7gGHMhodEsrIvcUGfX70TlrC5hErvHwlfTVVTfGqKcTDhS329l
	rD+FaM0sMNpM3jsx9euuXm8KFkx502Dwdn3v5snXh5/yrmCGjVUmHg4VFsC3IQOm
	rLgVcc1ZcgdX7GJ2QRCaCaXSBBv1eAIhu8iM2xjO6xiG+7n3ECRMdG0oJq9aKmiI
	6SG12snIId67D0+6rJud3wzLSmPtuY+EFsHc/yywdYZFUwR088jM6Mk0ITGUNKvn
	qf3WI/ip6fDNv+zXdoNPQCXdP6unHlzazkw2UySLnA==
X-ME-Sender: <xms:P46MYzvkUIE9aAbyhKZ5xYdb6E_zNjnLgcSXVed3u_JPDYFlalAFUA>
    <xme:P46MY0dL2JSgQQQFPD_QnBCs9YwuQ0hZCxxxWbYhrsT-7PbvOO3waNCDVA8UBJ5Jd
    sc6wTVP5DdQ_oSIErY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:P46MY2wvjqIL0WULSDsDjK2-iWTcNk577njI8u8urdyWK-INhkIjdw>
    <xmx:P46MYyOlmJlUGLbTFFm1o1B00hIvptlHzyHb1bGuRvSjePi_cyJwKw>
    <xmx:P46MYz-G41yzfBtB2Sie70DPf6o0D0uviTpg1dU4jIB6f2uxc1rpew>
    <xmx:QI6MY_TKF5dWc-RYdd4P32M5mWDH0VGUvz1FAOLC-6R8Be_t2ivPsQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 623A3B60086; Sun,  4 Dec 2022 07:10:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
In-Reply-To: <Y4wnGgMLOr04RwvU@google.com>
References: <Y4wnGgMLOr04RwvU@google.com>
Date: Sun, 04 Dec 2022 13:10:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, soc@kernel.org
Subject: Re: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Content-Type: text/plain
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 4, 2022, at 05:50, Dmitry Torokhov wrote:
>
> SoC team, the problematic patch has been in next for a while and it
> would be great to get the fix in to make sure the driver is not broken
> in 6.2. Thanks!

I have no problem taking thsi patch, but I get a merge conflict that
I'm not sure how to resolve:


@@@ -186,23 -182,27 +180,43 @@@ struct qe_pin *qe_pin_request(struct de
        if (WARN_ON(!gc)) {
                err = -ENODEV;
                goto err0;
++<<<<<<< HEAD
 +      }
 +      qe_pin->gpiod = gpiod;
 +      qe_pin->controller = gpiochip_get_data(gc);
 +      /*
 +       * FIXME: this gets the local offset on the gpio_chip so that the driver
 +       * can manipulate pin control settings through its custom API. The real
 +       * solution is to create a real pin control driver for this.
 +       */
 +      qe_pin->num = gpio_chip_hwgpio(gpiod);
 +
 +      if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 +              pr_debug("%s: tried to get a non-qe pin\n", __func__);
 +              gpiod_put(gpiod);
++=======
+       } else if (!fwnode_device_is_compatible(gc->fwnode,
+                                               "fsl,mpc8323-qe-pario-bank")) {
+               dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
++>>>>>>> soc: fsl: qe: request pins non-exclusively
                err = -EINVAL;
-               goto err0;
+       } else {
+               qe_pin->controller = gpiochip_get_data(gc);
+               /*
+                * FIXME: this gets the local offset on the gpio_chip so that
+                * the driver can manipulate pin control settings through its
+                * custom API. The real solution is to create a real pin control
+                * driver for this.
+                */
+               qe_pin->num = desc_to_gpio(gpiod) - gc->base;
        }

Could you rebase the patch on top of the soc/driver branch in the
soc tree and send the updated version?

       Arnd
