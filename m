Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9778F194
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 19:08:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Xvm4xp1zDr1V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 03:08:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Xsj53lkzDr5J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 03:06:13 +1000 (AEST)
Received: by mail-oi1-f170.google.com with SMTP id l12so2774899oil.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMTvDs/6w6O8oMbYwXZeEdzM8/92UUO2SkoKGDEM19w=;
 b=cKHGBGnAhHVAHl3ZjWnCBty9Os1p14rVD/jnq4UoZrFzzSVv6zvdETENmD1qQw2UXb
 CR/B649LBpVFKfzXISbeUPDXqvpuxV2LZmPIh+y+8+P3Pws6yYR2elCZ786mmka3Ie8w
 wpZQO29Y6urft8pH6BIAhca6H+7y1WxcBVROLTN4EwzazVUWj4K0PXnxT+uBhmN1aXMt
 4Y/lT7VCOx0RMv7I+WKjtavHBbhOVsytVsTMkqvHyv2sQVqNIxHpwIHkJ5Fw3tvKDVky
 aBm3Z285/v5XeiLbzQxWeR3HOQ/kL8OHttDYAM8IrmkmNTJM385geXFQvBT440tfQE/n
 YHfg==
X-Gm-Message-State: APjAAAVa54xMb+BBncLQAU5k/4ZzcNxPPcoEWjB584wUGw5VR8vsBTeU
 JfyYN7cpTCTgYl6kEuKxeo/xflrYvvCSdN0Pg5oITA==
X-Google-Smtp-Source: APXvYqyOg3etaiR02sz/x9QqUT30EmYIH9yRq8b/NOcW6ovLglLbfE+4/Eu9vxX6BqLxL9sbxaYfauZq1qFhAj7IBFM=
X-Received: by 2002:aca:fc43:: with SMTP id a64mr2316446oii.57.1565888769722; 
 Thu, 15 Aug 2019 10:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <87mugdtf08.fsf@christian.marillat.net>
In-Reply-To: <87mugdtf08.fsf@christian.marillat.net>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 15 Aug 2019 19:05:58 +0200
Message-ID: <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
Subject: 5.2.7 kernel doesn't boot on G5
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: marillat@debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Does that ring a bell to anyone here ? Thanks

---------- Forwarded message ---------
To: <debian-powerpc@lists.debian.org>


Hi,

No log only a photo :

https://www.deb-multimedia.org/tests/20190812_143628.jpg

Christian
