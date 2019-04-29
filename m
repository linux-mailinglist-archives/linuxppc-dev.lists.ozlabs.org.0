Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F95E63C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:24:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7jy631mzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=jacmet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NMtm7loE"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7f25cJwzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:20:58 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id a6so9517176edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=mcdMJtYTzbrFusKEz05dVZkKSln24Oc8rmFJOLHlFyc=;
 b=NMtm7loEpc1LtkiaskUlbbeKkI7Yur5IYVgFyYL/NUTYqRo00L+1M56sDV1wd61Eic
 074Hciwdzeq59lUY+emKFAFZuwf6s0YdW71qd918YF2wGclyc0PYWeqExnpOiAhdtCU+
 CugXqkaoE30DMKVWaPIwatHrP4MHEtOIK+xDDsmltZh5gMFXbPuH28VGT0LKdDVx7Kci
 NM9fmLAlxt3fKfmamYW2yxGr9RbaioIm25eCrQYGbaQLBSlnmiE5E79RZy2SAIQzJ09y
 /8xviY57bx916zBUV5eOMAwXesFB85WVdwsbKrEe802pzwew/ZbsAd943pi/DNCJaLOo
 Cx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=mcdMJtYTzbrFusKEz05dVZkKSln24Oc8rmFJOLHlFyc=;
 b=bQkubdfp342lD9F15wVYaJwbppKYYjmOXRbHMk6CGapuyaMWeLlZFF0lnwkqpzQvF7
 Ul2hdcsPdHFpu8W+jMup5u2eqjFWhNEFC5BA14vvKuz/ssF7L2Ee2bFF4zVPCtjXOsFE
 wIrXcWSrQsAHboJcs4CBmFcREeMZqSKQ9jwhBnKkUPpvK0zht3gDe5qbw9B9Jdvb+a0M
 9CVBMSzpO61DsnuELIeAeT9+U/dsnF9mmET07Bfg9V1eHMXC6LKGHo4y6zLVmkkvBHQs
 z4Id9YWObXa9goY2G1lhZqGQaRj93cTOKeYafwtvIUxuJL+U8uMOF8fLTP7hLa58MJ0q
 E7Fw==
X-Gm-Message-State: APjAAAXOj1kW32OltvU8Z7sZWlNeeP+UY8SI74O+pLotvCWn4wEbs6cu
 MM97GzOcKFsPkGlfiBbkEpA=
X-Google-Smtp-Source: APXvYqweysPzcxqvyw2tG1BMJOB/LdC5EufVXTrbhZSqeXGXptVb/Oa4KlfV9hkDZfTJPecfQ5Owcg==
X-Received: by 2002:a17:906:e119:: with SMTP id
 gj25mr7661484ejb.7.1556551255068; 
 Mon, 29 Apr 2019 08:20:55 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o9sm5761786edh.95.2019.04.29.08.20.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:20:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL85N-0000ep-Qh; Mon, 29 Apr 2019 17:20:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 14/41] drivers: tty: serial: uartlite: remove unnecessary
 braces
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-15-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:20:53 +0200
In-Reply-To: <1556369542-13247-15-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:55 +0200")
Message-ID: <87imuwrg6i.fsf@dell.be.48ers.dk>
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

 > checkpatch complains:
 >     WARNING: braces {} are not necessary for any arm of this statement
 >     #489: FILE: drivers/tty/serial/uartlite.c:489:
 >     +	if (oops_in_progress) {
 >     [...]
 >     +	} else
 >     [...]

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
