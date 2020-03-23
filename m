Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1DF18FCAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:25:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mN9G0PQDzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 05:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=FH2qRmBS; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mN7F5S44zDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 05:23:52 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id i3so8745494qtv.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 11:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F/E2v/x0pD9S4co1rTwzqU5wtimX1Afhqg2gi2bulTI=;
 b=FH2qRmBSbSJZwB+BSXSQMYNKeGdg7FKsSXSb1K9JlVNhBvCRpF35Y1/cWbC8uK2uBj
 sxGBJGFMVlcJsfQa8mZ95ubQaEtjdmQCqtEE3Q92O2nL8F41seejAlpR8I49wXqAeU/B
 eqkpUOGxjScSYfB1LTpqwq4PRjJgwkCS4B5OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F/E2v/x0pD9S4co1rTwzqU5wtimX1Afhqg2gi2bulTI=;
 b=nf0+7SSVNQtB6HM2Mjxq3CTivrXsGU/QjVPm+TyLXO9dXJ3kuZKP+ATonU9ewpokV2
 Hf1WFNIobo1AmGt4qdOwtzZH88HuJ9nMjxJi+umMp0NYfJHM4ZnJmVkw+JTKMhbDzNkF
 7a/Zisff7olcUVso5P02unUkGS6QIYZOaqiJAsA2qzKtcWcQ2zGKMybtcgb9caX4prBZ
 Sks1s7/PkEnNzeITZyWdQd5rhlBLegdgsnqtB95hMTTOCxwa7cy3N1RPRSp+NOIepCg0
 HOfPc0qSKA0fKObpYWSWhgsIqcV6y846FB7sOwjmfC3t6YwoSX33Wktq/DsrR/V0Odor
 p2FQ==
X-Gm-Message-State: ANhLgQ0VzAMf53oZMxtADK2COnOT9RUVzn2bbYWtmX5SPJBI3mldimLi
 E4+fOyFihpeCgPvXR657MhAzzQ==
X-Google-Smtp-Source: ADFU+vva33T81FQrImBGAaIoEJK5Y8QnH9XQzRThIpIuh9LK6narFxQkMI+JxtK3VLi/dxYocOD3FA==
X-Received: by 2002:ac8:140e:: with SMTP id k14mr22547629qtj.222.1584987830199; 
 Mon, 23 Mar 2020 11:23:50 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id 85sm9774863qke.128.2020.03.23.11.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 11:23:49 -0700 (PDT)
Date: Mon, 23 Mar 2020 14:23:49 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
Message-ID: <20200323182349.GA203600@google.com>
References: <20200322021938.175736-1-joel@joelfernandes.org>
 <87a748khlo.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a748khlo.fsf@kamboji.qca.qualcomm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 22, 2020 at 08:51:15AM +0200, Kalle Valo wrote:
> "Joel Fernandes (Google)" <joel@joelfernandes.org> writes:
> 
> > Reword and clarify better about the rwsem non-owner release issue.
> >
> > Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/
> >
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> There's something wrong with your linux-pci and linux-usb addresses:
> 
> 	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
> 
> 
> 	"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,

Not sure. It appears fine in the archive. Thomas, let me know if you wanted
me to resend the diff patch. Hopefully it squashed fine into your original
patch.

thanks,

 - Joel

