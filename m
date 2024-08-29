Return-Path: <linuxppc-dev+bounces-742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D49640C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 12:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvcGZ0vTZz2yvn;
	Thu, 29 Aug 2024 20:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=15.184.82.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724925622;
	cv=none; b=Lb3kSI0CGx+LqI8VE3G2L1tng5VwOjEXK1Kw3hUCMYMe/jujagqaE93kD6YHyJrd9AmOuvElxJQKq3JAxtYcu9luqPv1FGszDY2YYYUQepqn7fxbXqu5lqWT0QgYx8PuEZwq67kFPSolVZjzQVjzmf82cYW7dpDfeZ7uTTxMtpowXy2wnHdR9YnVq2RnfGOYKXlrR9I2OqjVS214ONZ+M6G6lqmPE53EfxTTMSzx7FT0HZF+zvgOuXYRSnZ7Md2K30U4Tvm/zrsW0827QVsBbfuPRUGZDLP+4l+TECfSMVmPqNqlu8lfsJVIne9IU6bwJzWsKR6PHGMxK8CM+o/Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724925622; c=relaxed/relaxed;
	bh=Vo7+bbWGPydlNvnRWAuOH/b+VKsQi5Dkw2OqAGcinBA=;
	h=X-Greylist:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID;
	b=K1b8qhaWea94BrW26nEAGxsTCCBYT1Ph8aQclPen/A9QN9zWtyEKMGjYGlaBVrTY3I2ZqYxmxONeijDG+9o6tkkFKkRztj+pRiaJyQ7v3hZ7eW0PaP3h+2MjMpo9K09Zna2vFTi7J7xheSF8qvjyTq27mtFxF7ju1xkrMfgKW8bKTma5o9pTPASt4OsvkI2vhxS1fbJ11kdvJJ6fcaRD1jjzvQTf3C2oojkZdst6bwILZjF1215ADmBYIFH8Slm2LipQIlFywHKcTaCeWc4ShvZuV0B1/oaJUgXYgLbi+RX5WcpCDWwMXV8d7OoxLQ4p6H+/MmHpavqSnLpjQGIJGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 97656 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 20:00:20 AEST
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvcGX3YQsz2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 20:00:13 +1000 (AEST)
X-QQ-mid: bizesmtpsz6t1724925540tsf67u3
X-QQ-Originating-IP: 82g7hF6P3776kDZusegigq9HOwuoLVAfdSLLth4y1SI=
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Aug 2024 17:58:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17198672222810151537
Date: Thu, 29 Aug 2024 17:58:35 +0800
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
Message-ID: <7435A42D8345CED1+ZtBGS_CW6uZL0YbM@HX09040029.powercore.com.cn>
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
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Wed, Aug 28, 2024 at 09:27:23AM +0200, Christophe Leroy wrote:
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
> > > > which should be sovled first to make it easier for further debuggig.
> > > 
> > > As far as I can see, user return notifier infrastructure was implemented in
> > > 2009 for KVM on x86, see
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1253105134-8862-1-git-send-email-avi%40redhat.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C260e5ecf10764312459c08dcc72dc2f5%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604246584044745%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3hjAzcVu3xOq0QNK5WINQ8trLd9Xp7XCiQjw2htabpQ%3D&reserved=0
> > > 
> > > Can you explain what is your usage of that infrastructure with your patch ?
> > > You are talking about debug, what's the added value, what is it used for ?
> > one example: I was thinking to live patch kernel at the moment that all cpus are
> > either returning to user space or going into idle. But I'm not sure if it is truly
> > valuable. secondly, it can help us get more accurate user/system time
> > accounting via tracing rather than through sampling technique.
> > The third: it could have similar usages in kvm for ppc as x86 for tsc_aux.
> > etc :-)
> 
> Thanks.
> 
> Don't we already have a very accurate user/system time accounting with
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE ?
Yes, there are many such instrumented code on various entry/exit code paths 
that could be removed in future, if we could find that the common call back 
mechanism like user notifier could be more clear and better implementation 
for such needs. :-)
> 
> Christophe
> 
> 


