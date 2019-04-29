Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D7E64E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:26:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7ls28SpzDqRZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=jacmet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ppT6h3G9"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7gH58tzzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:22:03 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id l25so9469738eda.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZZLpdCaY45ZaWdwl3+E5Jd3Cq8zuL6naI6wCwSuVKCg=;
 b=ppT6h3G9NuDkcYADi9LW7X3uSGDINXrGpBwPcqsBRDIwXcck7cMScr22OMFoQ4Q7dW
 8uh86qWSdCnDSh32a04j0feRNOwLlME9xwUQVKfgPlstvStLeefqu2rH6ctjy4IBUOxV
 0P0njK4P60TKRpkJScyHOWfv1632H2NqB/u65mqvsAgn8LRYGDLgrAGBd7Cg0dA4XFPY
 n/8jtVt529dPhZATwWpD1GFMOYJDyzMVBjkgHGjF4ebsEjG315Nc+bx3U2dCTC6VylmX
 CPnB7mvnD2IcDGboMWFxmbnYxHKPLBWhHPOFppg2uPmIHZWARZSoVFjkzBRZXy+KJFjB
 hzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZZLpdCaY45ZaWdwl3+E5Jd3Cq8zuL6naI6wCwSuVKCg=;
 b=smeDwD9LC3oQyD93AodmF6bq1E5i2P2AzN1qWYPBlMqx4j/MUW4YmX9CHFOeX2GgKv
 /7r0n8QB+yyZXRd7hGuveIuVYarF3ro9z+3kGhEYKo2yd6FZIt5pmKfKJT6oQsT1yB/a
 2EFe4KtLF0VxhSTNEhXh2rve/Y6iDB4mT7GrCtdGaGOm1OS654RvtBDipg3FNoO7FbYl
 PKq/2KgegMD1v3KCkJAcTHqPWf/J8tF+iIR0YdWgkIvtZpzpeoFM1vGEnKt255KFQaJk
 xMSR9ObHD6eelcKoONLuVlepYfDLZQ6ltw1CdaoEdXLxhGgelmtaD7kj9dVSZbc2Cxzc
 ilsA==
X-Gm-Message-State: APjAAAWeWWttsl/u2Vd8zEaZCZ9/+lT+upC+S5bzZE95lGhMsdltPLPY
 /n9SHSF0lpjM5nwp8YVsLWM=
X-Google-Smtp-Source: APXvYqxamfPfJ9uZ6AGqPNu4zJZ93wicN/YjM8vFds68tQNGSe4lFFbL+0I10So0tU7LuEyBIVAoBA==
X-Received: by 2002:a50:b35a:: with SMTP id r26mr38872334edd.239.1556551319341; 
 Mon, 29 Apr 2019 08:21:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c8sm2079732ejs.41.2019.04.29.08.21.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:21:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL86P-0000gI-Kz; Mon, 29 Apr 2019 17:21:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 15/41] drivers: tty: serial: uartlite: fix use fix bare
 'unsigned'
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-16-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:21:57 +0200
In-Reply-To: <1556369542-13247-16-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:56 +0200")
Message-ID: <87ef5krg4q.fsf@dell.be.48ers.dk>
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

 > Fix checkpatch warnings:
 >     WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
 >     #562: FILE: drivers/tty/serial/uartlite.c:562:
 >     +	unsigned retries = 1000000;

 >     WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
 >     #574: FILE: drivers/tty/serial/uartlite.c:574:
 >     +				 const char *s, unsigned n)

s/fix use fix/fix use of/ in Subject. Other than that:

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
