Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E655B3EA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 22:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWMHR6rnKz3chX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 06:03:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.130; helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWMH043c7z3bhK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 06:03:06 +1000 (AEST)
Received: from [127.0.0.1] ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.163]) with ESMTPA (Nemesis) id
 1M2OEw-1o4zyB1Diw-003yEi; Sun, 26 Jun 2022 22:02:49 +0200
From: Darren Stevens <darren@stevens-zone.net>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Sun, 26 Jun 2022 20:49:11 +0100 (BST)
Message-ID: <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
In-Reply-To: <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
References: <20220625214151.547b3570@Cyrus.lan>
 <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
User-Agent: YAM/2.9p1 (AmigaOS4; PPC; rv:20140418r7798)
Subject: Re: drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:SfjM5pV+pCrwIfqqWLt5BucTGFsV7UlQ9sOJsi9ctwNRtha6p6J
 jzxbYOU7vl8B+GSK6glrIIwUq3zjjXVSab/KFFYaOXKS2X6JyDR2WCFkygAguW6+ZE/EHxw
 Hb6lpr/xPB1M0B1X37T7YeSt7dSxZvoeMVaj5Pqku6YJfp7k+NJRL++sYrMV+Es5BnjKiV6
 NhmjV7uHikGIfOL43TjMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0HwNF0z0VZ0=:VXyehQB/rnX0e7HElsbuyk
 WRuGiGxVWf7JU0F9UjAU6whPCj0cC6NDWqUOBsOUZPRx3S7QE5bL9yWuVTYybzRfc2oICqDBW
 PWiJOU1xZcYxuDvbH3+7oMJQqnLhSUXAZ9BDFaVyXnG3ObfLQI+DjdoCecOhpuxBf9SglCyZs
 PmA0YQsBQrNgfZTh/ubxw5cOB+0J18aPPxW3qmy3pu1Vy/OZM3VO0EqSlCjKbksVMeSlBiNuW
 PluFD77fPAXp2dGHabqAXBzl0906B5fOTv9dnSO6KwbQ9XmXsBrWTCuUaqH+sQnt9hQqwaHRB
 dinM+Dg2ZxxXoHC2ui0wWHUFcdV4JsCjT6TU4ptOLkuIJFPhxp7vnpEiAghuHxsSMkFaPuXkF
 bVLoN3BJxrr+JDxT8Kd739ZgvgK7f+9rh+QSvg3JvpAEgc8GS4yfll7CDh2Q9TY+IoKxMOiCA
 4FSeZXX9kGZU35Ej29oT3CSjgRYlD2WPu2MsK5PF0z6oQz3oi2aJcWbmLEgyisK1Ta2smOJk3
 DMcsbTew8KD0QUdkRqn9CnAG68c+89z+BUNhgAjzqFb1w/glyQPyAQ+fs4978RgFaage8feIf
 fTEblJVAbL6esH0lY9XKOMAe6QFlXFQQVKqY2aTfgoEOF8BGvo+OS/Mpcn+81ejHZZQc9l+yS
 ioRxL/Jnfv2lRt727FGHMi8s6zi4X8mo7YHBhW9Q1KUFaJn30zu3zaIaWPhfiazrS9qWejFaT
 gX+ikblbHoBS8E8SZShQIN9t5plEg9oseWJDWTRH5W4dIOEJMfPtdO93tPk=
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
Cc: robh@kernel.org, shawnguo@kernel.org, linux-usb@vger.kernel.org, leoyang.li@nxp.com, oss@buserror.net, stern@rowland.harvard.edu, chzigotzky@xenosoft.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Sergei

On 26/06/2022, Sergei Shtylyov wrote:
> Hello!
>
> On 6/25/22 11:41 PM, Darren Stevens wrote:
>
>> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
>> core) we stopped platform_get_resource() from returning the IRQ, as all
>
> In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core")
>
>> drivers were supposed to have switched to platform_get_irq()
>> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
>> it. Also fix allocation of resources to work with current kernel.
>
>    The basic rule (especially for the fixes) is "do one thing per patch".

I thought I'd done that, this is the minimum amount of changes that fix what changed in the specified commit. 

> [...]
>> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>>          goto err1;
>>      }
>>  
>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -    hcd->regs = devm_ioremap_resource(&pdev->dev, res);
>> +    tmp = of_address_to_resource(dn, 0, &res);
>
>    Hm, why? What does this fix?

With baseline the mouse and keyboard on our machines don't work - dmesg reports no interrupt. Fixing the interrupt detection throws a 'invalid resoure' error instead (No idea why), which these lines fix. Both problems disappear if we revert the 'fixes' patch.

Hmmm, perhaps title shoud be 'fix resource detection in host mode'?

Regards
Darren

