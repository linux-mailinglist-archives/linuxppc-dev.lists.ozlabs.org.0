Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3AE65F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:29:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7qM53rzzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:29:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=jacmet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqOlHKGB"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7ly39d3zDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:26:06 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id k45so9505713edb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=aonALYgL+fC9zvkDd9D30wIh1ca4DE2TOFz5g+1UCQg=;
 b=MqOlHKGBUrtkGw/thEAiOVcQipneXzleb0RM/WE/NAIrWKwuZ/igOcZfZutIC36Y+D
 kLv5JhJxZNlHfPV2unFalEBIn+R251ZYHMnUFKHLzWPTKPDBh4j1DH5fBQWKGZMvzLVb
 SMz6kHEmwAk1jVmwT0zVVqmJxkqUZFnh5Be3UtymNcZBxrZC1dCeA8ZWGCke6h3WuDTI
 PsjH3VSHWs1BZGE7yQ1Vs9L+vcwsR8eXgeZFz0UjkEq1+l6KvTCFALNtGLuE09m3CghC
 cx6yoPLSQGZxVeq6086SUPMPKPbmJkifbBv8cOkt/YaQS5IgtCtZFbdEKFHyYcct3Z1K
 HqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=aonALYgL+fC9zvkDd9D30wIh1ca4DE2TOFz5g+1UCQg=;
 b=XZhRRsGKGxT4DGRinxARhUcTSgXDqr+XLGjYzQFOmGeGfhxmOsD76nvxgFyNXD4Oet
 gifdhOQbNitq/F6l6m9G8TIDrJzESo9kMwOrT9YLAuzSKPfnMfdn7lz0RLXCqyK12XYF
 zPjZM7kUBFmyyvN+rGU/kXPlp8LTRjmWEOTuPDIk2g3WQxoMkjE6LotILskB8AUheX+t
 VxnVNsII4eKtWJMaKbkzizoOTPfGOuLP9VLWz7WoPx0VYggV47J/aXLj658fTQT9z6FA
 QE0rGc3OL8FIUI5dyyOh6jnqnrfXtlu1TECdmeI/irJ7XNBVd01cEErEjUCxBs2Gnduh
 C4bA==
X-Gm-Message-State: APjAAAV/hind7xSJT16iMtPS7DNiwhG8HEkEcwdMI83n0wC94ufwplzf
 GbdO8Fmy/p5RV5y8IJKCgVo=
X-Google-Smtp-Source: APXvYqyEQJEsE2ti6PwOMykBv5n2TIgt00/3l4kIKwcwjUrTagamP80EumknDfmmfKrxqeVCL9NbNA==
X-Received: by 2002:a17:906:4c95:: with SMTP id
 q21mr31492152eju.14.1556551561666; 
 Mon, 29 Apr 2019 08:26:01 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 z32sm862711edz.85.2019.04.29.08.26.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:26:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL8AK-0000pF-C1; Mon, 29 Apr 2019 17:26:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 12/41] drivers: tty: serial: uartlite: use dev_dbg()
 instead of pr_debug()
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-13-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:26:00 +0200
In-Reply-To: <1556369542-13247-13-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:53 +0200")
Message-ID: <875zqwrfxz.fsf@dell.be.48ers.dk>
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

 > Using dev_dbg() instead of pr_debg() for more consistent output.
 > (prints device name, etc).

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
