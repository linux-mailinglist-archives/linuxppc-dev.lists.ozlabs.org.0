Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2F33AE30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 10:08:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzVtz0DxXz302g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 20:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzRtP41Mjz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 17:52:09 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DzRrN55w7zlVhs;
 Mon, 15 Mar 2021 14:50:28 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 14:51:49 +0800
Subject: Re: [PATCH] powerpc: define the variable 'uaccess_flush' as static
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <dja@axtens.net>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
 <aneesh.kumar@linux.ibm.com>
References: <20210312110638.178974-1-heying24@huawei.com>
 <a06a0dc8-c717-da4c-c5ad-eaf56bbbd896@kaod.org>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <2c7bf6e0-d950-c728-bfe9-2db99a4d18a9@huawei.com>
Date: Mon, 15 Mar 2021 14:51:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a06a0dc8-c717-da4c-c5ad-eaf56bbbd896@kaod.org>
Content-Type: multipart/alternative;
 boundary="------------7D2E77D4DAA772EC4AE12991"
X-Originating-IP: [10.67.110.136]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 15 Mar 2021 20:07:38 +1100
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--------------7D2E77D4DAA772EC4AE12991
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


> I think this is the case also for entry_flush. compiling with W=1 will tell you more.

When I use these commands:

make allmodconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
make C=2 arch/powerpc/kernel/setup_64.o ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-

I find warnings as followings:

arch/powerpc/kernel/setup_64.c:422:6: warning: symbol 
'panic_smp_self_stop' was not declared. Should it be static?
arch/powerpc/kernel/setup_64.c:951:6: warning: symbol 'rfi_flush' was 
not declared. Should it be static?
arch/powerpc/kernel/setup_64.c:952:6: warning: symbol 'entry_flush' was 
not declared. Should it be static?
arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush' 
was not declared. Should it be static?

When I use the command "make W=1 arch/powerpc/kernel/setup_64.o 
ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-", warning becomes this:

arch/powerpc/kernel/setup_64.c:422:6: warning: no previous prototype for 
‘panic_smp_self_stop’ [-Wmissing-prototypes]
  void panic_smp_self_stop(void)
       ^~~~~~~~~~~~~~~~~~~

My sparse tool is the latest one with the version "v0.6.3". So, should I 
fix all the warnings reported by sparse?


Thanks.


--------------7D2E77D4DAA772EC4AE12991
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <blockquote type="cite"
      cite="mid:a06a0dc8-c717-da4c-c5ad-eaf56bbbd896@kaod.org">
      <pre class="moz-quote-pre" wrap="">
I think this is the case also for entry_flush. compiling with W=1 will tell you more.</pre>
    </blockquote>
    <p>When I use these commands:<br>
    </p>
    <pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 12.25px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(35, 40, 44); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">make allmodconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
make C=2 arch/powerpc/kernel/setup_64.o ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
</pre>
    <p>I find warnings as followings:<br>
    </p>
    <p>arch/powerpc/kernel/setup_64.c:422:6: warning: symbol
      'panic_smp_self_stop' was not declared. Should it be static?<br>
      arch/powerpc/kernel/setup_64.c:951:6: warning: symbol 'rfi_flush'
      was not declared. Should it be static?<br>
      arch/powerpc/kernel/setup_64.c:952:6: warning: symbol
      'entry_flush' was not declared. Should it be static?<br>
      arch/powerpc/kernel/setup_64.c:953:6: warning: symbol
      'uaccess_flush' was not declared. Should it be static?</p>
    <p>When I use the command "make W=1 arch/powerpc/kernel/setup_64.o
      ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-", warning becomes
      this:</p>
    <p>arch/powerpc/kernel/setup_64.c:422:6: warning: no previous
      prototype for ‘panic_smp_self_stop’ [-Wmissing-prototypes]<br>
       void panic_smp_self_stop(void)<br>
            ^~~~~~~~~~~~~~~~~~~<br>
    </p>
    <p>My sparse tool is the latest one with the version "v0.6.3". So,
      should I fix all the warnings reported by sparse?<br>
    </p>
    <p><br>
    </p>
    <p>Thanks.<br>
    </p>
    <pre class="moz-quote-pre" wrap="">
</pre>
  </body>
</html>

--------------7D2E77D4DAA772EC4AE12991--
