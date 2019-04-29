Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE6E625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:22:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7gf1HXxzDqQr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=jacmet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBvSV/Sr"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7d50fFkzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:20:05 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id y67so9511128ede.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
 b=BBvSV/SrDNJ31+/UOkSM5bpG5QGX9iuVEAlHSpvrDOGj+4PW80QrSA2NQvvNYxzojp
 Zd++WkJIJdsJI48+0P5HrqTBvNXDC1r245KbMoADl3uY5vH+mVrnUi6+8qjpF2ydE+tq
 TwF1hj4480FhhbTHgn4M/QznEs6p0sHaHA9yrWx15VQqD4rerfkEYjhIuk1lUIvL8NJx
 M8wE73xeYfkcTLVAM5oCB5RVNjauTgvl4PjUAhsoMUZ5oTPhnvZ5wvz6bSMifDGNwT/e
 KSK9tYNcpfIF8GPBuVeJpf2B9oLlA2ItKshISp7tatkcaGkzhTIiD3dveMl7nJ6B+iIV
 zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
 b=ICgp9a+OuGFHLAeEcd6hkDWUSM3PxBp5s8cTT876PsV6JH9NFG1w09DiPXTir0Kmzn
 6K9HiqfKU7rACWVaZzRZCPTCERLp3UjTkLWrLjZFmh+I2IhNpkRcucbBiWrLps2cR8KK
 UNZig6+PWjrN4/ywMCl1F+yipWxkLskRY8RPkRUYZjVaUMXttjPz43nnhR+sOviCXDy6
 agjjsEgAcDnUD1xZ9UHC5vj2nMSrv6jrotdf21jX0FZyFHXX8uqazoDmhQIzfnDGr6Iv
 mslre7ZDleoqGSXpgSQ/qCM2xzUHtQtnr6O6s/sQS5A+7Q3/rZ61Au0vny4qbomXjlUl
 eEvA==
X-Gm-Message-State: APjAAAXvykZ0rSMpbTCNHWQooIvnoIWcjBnWw1HDWqMQRiV2LV+Rhe/Y
 zkYq/2jCKE2yJmP7HybToUc=
X-Google-Smtp-Source: APXvYqwQbi0omP7jYdcby2odHruq4pxaQ7sP2Qij52VODZOog6lth6WIRzjEKd0jUTWzRbOuB+nVlQ==
X-Received: by 2002:a17:906:2482:: with SMTP id
 e2mr12684688ejb.289.1556551199464; 
 Mon, 29 Apr 2019 08:19:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p18sm5851269ejm.4.2019.04.29.08.19.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:19:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL84T-0000dV-Kj; Mon, 29 Apr 2019 17:19:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and
 use it
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-14-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:19:57 +0200
In-Reply-To: <1556369542-13247-14-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:54 +0200")
Message-ID: <87muk8rg82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org, vz@mleia.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fill the struct uart_port->mapsize field and use it, insteaf of

s/insteaf/instead/

 > hardcoded values in many places. This makes the code layout a bit
 > more consistent and easily allows using generic helpers for the
 > io memory handling.

 > Candidates for such helpers could be eg. the request+ioremap and
 > iounmap+release combinations.

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
