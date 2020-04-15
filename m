Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809751AA484
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:36:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Nfj562SzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:36:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aishwaryarj100@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IfPy7LVH; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492NHb5jK4zDr31
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 23:19:39 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id x26so1456886pgc.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mGivcgEJ6E876yj00y3QoKcNXlu3JKn22U740NPN6wE=;
 b=IfPy7LVHeMGkWmqorJ6OgR3uVTalPLTzftap1Wuz4dA3PVwCzEi0GBWkixQcOITQ/U
 /mx6tx5mAtFfpJr5K8A+uCNfaUXZKsPVrGiGnk+amCKDOLSRySJOPXRK+PdWkN6vnuI7
 XmQsg5tBqG12SCEdkuYUkvSZz+1etZmwx6pqXbcIZlHOPZS4p3D/fTI2wtCl+Gpl9+X/
 AYNFYNeduNCOdLZVzkcJZWRm6poyG/b2bKyQny9VrktjnvNY2LMtsSUn75VwvVcn6OV1
 GD7c6FG8Yobax+jXnwLWKMHtvitBw0bxk9pLzmh20zRreyYASNDTT78JGpADNvwrgkJn
 JVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mGivcgEJ6E876yj00y3QoKcNXlu3JKn22U740NPN6wE=;
 b=XUngPyvj0XhgqviNF8Vr7bP3mjz26y3UAbA9/mh3sXRHhq3TPjqvd3YDxeVnM7qiHu
 leDx8MO0moIRuLgHu5BLxemYraW3wZ0pM3K/gJd+M1o1EmJVZvvyArspg7YWBND9qlA8
 +8U+qN2PpMSzDkF2/PLqAsPGVMewQdpzSg1KrMs6OH6pX8KhnVO/N8vYQ24hQKFPzpAV
 +e3rkvVkWU+38F9ei/7jySqn5BN/z+wauoMr1ybGXEYzuRyF5fmPQReVsKc+ofcDDbux
 l2tU/S9cbKLobO7TtlayOJBZrfz7OlAYWMn2JJhtkQIr3Qsgde36NOuH95dbdYFkUocO
 Exgg==
X-Gm-Message-State: AGi0Puag67HPgT28FsDax50pqm1EMnYD643+fdEpRciLbchSXb0ZLG+j
 05X79hOs34Q6hgGBuaq5itE=
X-Google-Smtp-Source: APiQypIBDKrme0mTxDjPnkAwvY8r34Ay4utm2CzhTMzkVCkR+WUfXWBN0Ic/WlLbhdK4/6ew0sMONg==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr20756378pga.264.1586956775700; 
 Wed, 15 Apr 2020 06:19:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6e1c:dc2f:f465:67ce:fbea:c439])
 by smtp.gmail.com with ESMTPSA id r9sm13403346pfg.2.2020.04.15.06.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:19:34 -0700 (PDT)
From: Aishwarya R <aishwaryarj100@gmail.com>
To: wsa@the-dreams.de
Subject: [PATCH] i2c: powermac: Simplify reading the "reg" and "i2c-address"
 property
Date: Wed, 15 Apr 2020 18:49:14 +0530
Message-Id: <20200415131916.23555-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408100354.17782-1-aishwaryarj100@gmail.com>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 aishwaryarj100@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> Use of_property_read_u32 to read the "reg" and "i2c-address" property
>> instead of using of_get_property to check the return values.
>>
>> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>

> This is quite a fragile driver. Have you tested it on HW?

This change is not tested with the Hardware.
But of_property_read_u32 is better here than generic of_get_property.
This make sure that value read properly independent of system endianess.
