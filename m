Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B811C6706
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:40:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3mw0w7wzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:40:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ktsvokFi; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2gF4wFfzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:50:33 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id f6so367626pgm.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YFGTinAglrHCw532JJiHLojn1LLz3itLbxJsYHWjYts=;
 b=ktsvokFiDURaZqcSj3W1opW60WcvUmJybvYyhMOBFtTL6+ueEhLXyG6zVncgwYsZjD
 3h8yg93S1cHIJfvJcKQh9s8kUrx8CntfwXgvW0S7Eshm1QnMw1eqNCw8MVW9qCVZFuB6
 HZC4yU+Fsgv51/KompEbJGM7KrGRwXwa5CozK8XwlswlXYTw6D8ExD9JeC8WTfs62jIy
 YvHGjiQCMC1XhCVag7zEXL4+HZ/YdvOtHowx/bB20EgM1x8A0NLn8vIHj6oo+fgOs5Q2
 tzHteYKPaGzwPiA2gKadSqn0xXpejv5KEPNJs/xiVvXDL88qefpK2lZZG67TXV9gNvAa
 Wh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YFGTinAglrHCw532JJiHLojn1LLz3itLbxJsYHWjYts=;
 b=N6osc9AQip/EvK2xC/zldfMqUn/FLNAEkPVcs5yLXFuMmQOuecnY4ZHRTwWVU21rfR
 oTct1PdiqJ1AzJJLvCHxSBwQ6kSj6ubMQMeYzq9Mm1NQYT3Ry//euhO1En47aAWwRw+1
 WcP8KVm+K53+Km3MBqKU5ickRVmHgQBCmNCJ8id68NzUOKShaqq7v9EbmvWuWiuEKuD5
 1eYwihVF1JduVx5yERDoN+u35Rl6wOHCJbQwL+TupM6Ht1woEh7HXQ3Dn0PKftxwwNmt
 G4PH0SS25Ta351Bh2Xe6X5VHYzdUDiplPcfBisEnAd/jAD3PlCn5RpmhDkYxDw7SV/pJ
 l6rg==
X-Gm-Message-State: AGi0PuY3F+YUykkl+dR6yhLENrsy5jdbWessMh/AvKm2Yl1e2bTaEy4l
 JkTJ02bN0WWMCJe5ZgOC74qq+chi
X-Google-Smtp-Source: APiQypIRLnwfCt5PdrJmmujX9pLeIM/DfI7KTfPL0O/oCGIyPHdw2aK+s6H//lf2IBCLErc3xRXlIQ==
X-Received: by 2002:aa7:8594:: with SMTP id w20mr6381673pfn.137.1588737031450; 
 Tue, 05 May 2020 20:50:31 -0700 (PDT)
Received: from localhost (203-219-223-175.tpgi.com.au. [203.219.223.175])
 by smtp.gmail.com with ESMTPSA id i185sm338372pfg.14.2020.05.05.20.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:50:30 -0700 (PDT)
Date: Wed, 06 May 2020 13:50:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/15] powerpc/64s: machine check interrupt update NMI
 accounting
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-12-npiggin@gmail.com>
 <684cdf24-a87a-1099-70c1-d3ff9a3921ff@c-s.fr>
In-Reply-To: <684cdf24-a87a-1099-70c1-d3ff9a3921ff@c-s.fr>
MIME-Version: 1.0
Message-Id: <1588736957.47flaruq3r.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of April 7, 2020 3:37 pm:
>=20
>=20
> Le 07/04/2020 =C3=A0 07:16, Nicholas Piggin a =C3=A9crit=C2=A0:
>> machine_check_early is taken as an NMI, so nmi_enter is used there.
>> machine_check_exception is no longer taken as an NMI (it's invoked
>> via irq_work in the case a machine check hits in kernel mode), so
>> remove the nmi_enter from that case.
>=20
> Euh ... Is that also the case for PPC32 ?
>=20
> AFAIK machine_check_exception() is called as an NMI on PPC32.

Sorry I missed your comment.  You're right, I'll make this change
depend on 64S. Thanks for reviewing them.

Thanks,
Nick
