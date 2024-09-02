Return-Path: <linuxppc-dev+bounces-862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0896821E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 10:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy2D864JRz2xFr;
	Mon,  2 Sep 2024 18:36:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725266200;
	cv=none; b=LiM5oAJamy1P6ZutK9yAxUZ9NV5c98htMNWosxN/gXi1fOVjxTm9dRtC7Jm3r9+qofGk3xKGqHuR4WoIeo1bnWZ3CDu9k4zrnQGM2/fafIVwFcuArgY0cSJaOeW1XMwjkFY8Ae+EE5ep8M1pr4ZDMRge2miuHjNhJr54pccSMKVP8tRXwJyYnFBEiDNB/GxIr0VrY2kUNcnhfuoIyvyqrpOBBSu1gRXp5cFAlNgXNqT5pDWWRvWrlMLc5h8H22bzlAszoV3qvNpqh0rpgyhGjwP0WIoLjneJjC3K2cer5yCPMO2Qhtx7xC21/I91IKt3sJIWn6gN/zAoeDNp/NqFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725266200; c=relaxed/relaxed;
	bh=U5SJ7XZw0KDETUP5IPnVdizRUpTewpEHvghcWZjet+E=;
	h=X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:X-QQ-GoodBg:
	 X-BIZMAIL-ID:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID;
	b=jVfiGbS7M2R65Wxvkl2ICIIVeN5TK3yOl2jlcYW2XGONdvCavhb1G2KPp6BPG3+NUarkqKIZBxTYq+WcG5xZOb/PDLPmNfwlTYIo7P6SWvb05KRnIgTzF/wStkDMaB3dKvffCJZXZJ7CzrBZO943KPxjikAMFmo541A9FddYWYQu203NhPCscBAhigaM0aTvDpVkNI68vcuVKFszVlYliqhREAwQOP2DDQvmRr96pqRQxSmgxcQrz0g2dHgo1JrQNOboBt4H4bH0eFoWGogh5tvpKEnaIHOZgE84+4RTA15VSYj3c9u7s28l3JipGQAvs0KWZG8HL9KnBOY91cxt9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy2D76DXcz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 18:36:39 +1000 (AEST)
X-QQ-mid: bizesmtp87t1725266091tu2fqcr9
X-QQ-Originating-IP: kGypH4P7jg3wvqEFFYagyp6a6SZcS9GvI3fXkANzjYY=
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 02 Sep 2024 16:34:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11960807525001457609
Date: Mon, 2 Sep 2024 16:34:25 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>,
	npiggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	mpe <mpe@ellerman.id.au>, "luming.yu" <luming.yu@gmail.com>,
	=?utf-8?B?5p2o5L2z6b6Z?= <jialong.yang@shingroup.cn>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Message-ID: <DD7156ED36F34F8E+ZtV4kSBA-XH1f8NS@HX09040029.powercore.com.cn>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org>
 <8734vyn1ky.fsf@mail.lhotse>
 <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
 <0638f0a2-782b-411f-9937-c62d99e9562b@csgroup.eu>
 <tencent_4F2B3C0025D5A1722470D582@qq.com>
 <bd4908d2-cea9-406b-902f-618626e74c88@csgroup.eu>
 <B6A4506E3DD1F93F+Zs7Iq_EF799NyWHK@HX09040029.powercore.com.cn>
 <3fbdc957-2db4-4148-b325-263384f9a196@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fbdc957-2db4-4148-b325-263384f9a196@csgroup.eu>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

Wed, Aug 28, 2024 at 09:27:23AM +0200, Christophe Leroy wrote:
> 
> 
> Le 28/08/2024 à 08:50, Luming Yu a écrit :
> > On Wed, Aug 28, 2024 at 07:46:52AM +0200, Christophe Leroy wrote:
> > > Hi,
> > > 
> > > Le 28/08/2024 à 05:17, 虞陆铭 a écrit :
> > > > Hi,
> > > > 
> > > > it appears the little feature might require a little bit more work to find its value of the patch.
> > > > 
> > > > Using the following debug module ,  some debugging shows the TIF_USER_RETURN_NOTIFY
> > > > bit is propagated in __switch_to among tasks , but USER_RETURN_NOTIFY call back seems to
> > > > be dropped somewhere on somone who carries the bit return to user space.
> > > > side notes:
> > > > there is an issue that the module symbols is not appended to /sys/kernel/debug/tracing/available_filter_functions
this is not a problem as I just noticed that lib/Makefile carries this magic
ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)


