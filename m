Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E79FA772
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:42:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CVn14HmkzF6fm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZXOS0ztS"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CTDl6VzhzDvrC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:33:10 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id k13so763372ioa.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 18:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lW9f2yrx9G2rU/MM6ZgLP68w6RXdpeLV/Gb8QzdPaGY=;
 b=ZXOS0ztSuvS+88OtaWYEUSKeB2Spcj8af88Dg15Z00SDKIPhfUu/cjALfhBL6bekHo
 2oANJPjLYGx7t8h498SUomrKmMaIqX4wjA61jhKiskPqvqfKxh7BFkdiXTdYWonjorSe
 MOe7m5uhX3hcprDi2Y/OJopvFx4rIR0+uMjwUdnFG1E9ea/+6TWupymjrdJIJibMiv9z
 4MfH1rfvS0dhlWISpIc/uLwFj4O0bUFnc+XAONdcWMQhjkSLZbXYsn5fHu3ZLw5Bk/YD
 x65BhZsVU0EpnpnT0d/e1+PCbsuc91PxNu+t7TtupklWt+JA44b0HNDVePX6pab68ecV
 7rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lW9f2yrx9G2rU/MM6ZgLP68w6RXdpeLV/Gb8QzdPaGY=;
 b=WrYsb6LrtraMXuie6nW3QitSLGxG9GPVDmwxGG2uNlC54SwGTXLB6iSCM0g2EuRLu7
 fp6XsHeag+gH5eHnpxinu9w9W98ytjFdLtPRoADngcLzF7ss7mv0j1Bw2h8KpK1s43YK
 NrEfF0MshLBrRp+XxiPNaGVWY/jUEm3S4Q8TE1LeDWc15yGAxMJ9CcnDsTFuwZkR7mUr
 kju1mZUZ0XFaAwuK8pN/SOt5NMFxY9wSa/NG3ZXIXDi0D1VOwjCqOaXioNQKzLvZ0a3P
 vPakv8gyrKkSnbua3tsfyUmFboNWNrZ8WKvlwEkQ2LaPsKQLeMrT3cdG+I8g83TSRCgS
 neOA==
X-Gm-Message-State: APjAAAVC922Jth+koO26NZZX+Lr83G5e5Q/kNgcCzpA5YIMDAKngCvPd
 hAnJZjyVi0QhgswR0f7O1FZqFlZsN0SkA67TcC8=
X-Google-Smtp-Source: APXvYqwpRHqfigNnWWX/5oCJZskujEbAjYLxDUaUW3nTg3xvp/8VgJBcxRGOuZ0GX3RhdTYy6zBomnPJwPqjprmniPw=
X-Received: by 2002:a6b:e315:: with SMTP id u21mr1154006ioc.192.1573612387916; 
 Tue, 12 Nov 2019 18:33:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
 <cf8b653e81c2a8a75dc37637ac853b92c724a3ae.1569996166.git.sbobroff@linux.ibm.com>
In-Reply-To: <cf8b653e81c2a8a75dc37637ac853b92c724a3ae.1569996166.git.sbobroff@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 13 Nov 2019 13:32:56 +1100
Message-ID: <CAOSf1CGXoA7ybFVgdh5WHoRY=jm5aeM497E70uiqiZswK1RC_w@mail.gmail.com>
Subject: Re: [PATCH RFC 02/15] powerpc/eeh: Rename eeh_pe_get() to
 eeh_pe_find()
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 2, 2019 at 4:03 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> There are now functions eeh_get_pe() and eeh_pe_get() which seems
> likely to cause confusion.
>
> Keep eeh_get_pe() because "get" is commonly used to refer to acquiring
> a reference (which it does), and rename eeh_pe_get() to eeh_pe_find()
> because it performs a search.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>

Good idea.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
