Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A3331A4B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 23:40:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYFL2kkxz3cK9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 09:40:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ek/lewEG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ek/lewEG; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYDr55FQz30RD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 09:39:40 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id e45so10884348ote.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 14:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wQvIDGso1RBFZCsL6ixTOcS0Wu2YsU6EKE/ysPX9/4E=;
 b=ek/lewEGWWKcVBwJKjOEuNn4V/El1kvmO132wgQDs0Nop8NdQDvQwIv9UU4wkRowm4
 olbH+1vBxE7emGSmO1gMGYtgdaz3TdxH2VYQm09srJR7Sdz+v6EiYYb5g/TcGZviL4jx
 Mn61bmIgJ8XnNEUe1t5RhzdRCKJGvZINrNpaTxyy/0H+6DK0H9rTIGxYgGK/em8Ys0S8
 Zwxr+tbMU1qRWh7nyOsA4nKhzMVJX4aFkE6LTmgAs1XCQ5GxPuHaOEbxaBxzLYqTHTF+
 0hQ7Y9mVSmCinX/3jtB0GV/gOGOmDH/EKvHpDYlp3MNRapFnJ08V/2EDb0CDIoZ94JLK
 H2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wQvIDGso1RBFZCsL6ixTOcS0Wu2YsU6EKE/ysPX9/4E=;
 b=hA6ON8CYXpWOCXtpeY07fBqRw0FFPTIob6RNxpfqUripyZAmdqavtlfP0KEoTpAn2a
 8ykadl1y9ylmqh1t/8vJZBgZ4MnIS3WrWuMD9nQCLjZquKU9u+NrgJc9SfVhU6CMnjFQ
 gSyjEWbY6sXwk8jo6A3qNowv76Tc2DHZFqS84aZAeGQbNTsXrgRZA5sUrBMbdAECU6ng
 ZXr7ziXrUluDqeUfFeW7E+Guiqw9z9MwzncCeUdqMYi8M/ppDoHUK7mGqYA8z/uajImM
 4QGXB57SWST/CnKvuEt/R4om2xaf3jXUEjq6XhXOQLorlbeRLO6EWOY5zIm0Y/15RKbk
 gz/Q==
X-Gm-Message-State: AOAM533vHW1tj1PRRnccjaNE+kyMyS4hw4DvR5XijEOmG+YCXKvdphpD
 tWTsv/8+HN/yZ078QYKVfdc=
X-Google-Smtp-Source: ABdhPJx8XlOlv8RaO6z9FNUkdOHyEa1MxP3s6FTna3PLeU0s6f4ziWS1rVKlVQvp9Mqc9QeAXg4Ncg==
X-Received: by 2002:a9d:80e:: with SMTP id 14mr21846215oty.211.1615243175971; 
 Mon, 08 Mar 2021 14:39:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h24sm33807otg.20.2021.03.08.14.39.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Mar 2021 14:39:35 -0800 (PST)
Date: Mon, 8 Mar 2021 14:39:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210308223934.GD185990@roeck-us.net>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 08, 2021 at 08:27:30PM +0000, Chris Packham wrote:
[ ... ]
> > Other than that, the only other real idea I have would be to monitor
> > the i2c bus.
> I am in the fortunate position of being able to go into the office and 
> even happen to have the expensive scope at the moment. Now I just need 
> to find a tame HW engineer so I don't burn myself trying to attach the 
> probes.
> 
A bit unrelated, but you can get scopes connected through usb which are
quite low-cost (like in the $100 range) and good enough for i2c testing.

Guenter
