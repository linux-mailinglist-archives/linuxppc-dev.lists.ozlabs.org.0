Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45137FA81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 17:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgwMf0tVkz308Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 01:20:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pjnimt6O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.221;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=pjnimt6O; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgwM64T1Zz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 01:20:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620919165; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Bs2AbNOL5fi9umJ2ujwKx73R79g/JMQN+OlZdUhS3vH3efOeujfTuQe+1G2k3dcN9s
 VDMinZtd0X1ZrAQiPdsP713PzeFtmvQH8yXmP4VuIv+i3DlCkBJFUhrx9hFSia7Vl6Ci
 AAcZ2R1gABC1WW1JyUFMPMxkiM0rR5flGPOM23ExpWRXKCRN65qL+vJeEGT/u03/17uQ
 k61F2mVZ5JGTngBOlQINs7fghudUBsUNjbkviYlCBUYT42/mqZAFrub9FkUcPtojcRMa
 /3A6CAp63WhqGefyG9POfmbz8DZZ8ApxmhTMtxF3jy0JxO1KLPPW2PurWgAQKyBP2sGB
 RVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620919165;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=BjMjHXwIWY+C8NfiMf8I73subyUiuAoslL5i08tD/sg=;
 b=QjtKrtlzSryV21dF9sTQL6xP+cJpaF43KyOCq1R2ruyFnhkADD/hzf98DYr2RMjhQd
 XpWm8BQd5a3FBz6yjLwNQDHV7ZKJ3JX65Wjib1vDEpJQW80+ZNFzyzDWdQHNV41HeRuC
 C6saKGLYY4AfptfYp8Ymjcm9tf5NshO9d40tVgOcqfJ80fEiIthhepJNiB28azYOKgsg
 Q0gJq8amWNkbiAoT8XPk3H30Ri7h4mlw3vfuTiZ6EF3TUPnWys0jwSD6GXzcjoQf2Xk2
 NbfuT/5tif9yr81IDQZVGLl2Y0z6S5edTStvVZLgj4TcSHul6P0U3lPK4DblMiblp1Uk
 h6Jg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620919165;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=BjMjHXwIWY+C8NfiMf8I73subyUiuAoslL5i08tD/sg=;
 b=pjnimt6OT4xLQg+i0JnCOiMo9z8WUPFATK6PY39UvLWldUFOapz42bqnKRpGs3TeQz
 UMbsRmE0aW7mcSpyOxEmQ1wzJjMHuzOYEALoijZ4Fz9k9UG/X5gXBzhT/tdICa6FWsPr
 oNi0q2UwBz94jwmsmUr5/q+0Xx+48jvP2igA74swPuVD/ebfjyL0PCi1m59xTYJeZFs6
 X6RDxQhVES4MYxfkzTsp3a+EHUjKIpSjdA1W8fWCSI8GZZJDuGhsCzIFg3LpMrQRUrHm
 TTxDkAEWH+qf6cgTWfO70ODmtiTS0+4z160dgxcSPyp3WOpzlKFCr/MYZxpb6PGBuGXn
 XpmQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCLz5q92XDIy4M1mOr4LR4+7m+VA=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:a903:7809:7981:9863]
 by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4DFJN7Mv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 17:19:23 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
 <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
 <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <781a426e-8561-108f-0e5c-9393bc653e86@xenosoft.de>
Date: Thu, 13 May 2021 17:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13 May 2021 at 12:01 pm, Christophe Leroy wrote:
>
>
> Le 13/05/2021 à 08:47, Christian Zigotzky a écrit :
>> Hi Christophe,
>>
>>> On 9. May 2021, at 19:37, Christophe Leroy 
>>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>> Did I do an error in my analysis ?
>>
>> No, you didn’t. On the contrary you have found the issue. ;-) The 
>> issue is somewhere in the new interrupt code.
>
> I'm not convinced, but let's give it a try.
>
>>
>>> ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt 
>>> context tracking scheme
>>
>> Could you please create a patch for reverting the new interrupt code? 
>> I would like to confirm your result.
>
> Please fetch https://github.com/chleroy/linux.git and try the branch 
> for_christian.
>
> This is a revert of approx a dozen of commits around the changes to 
> 64e on top of v5.13-rc1.
>
> If the top of the branch works for you, it would be great if you can 
> find out which one of the reverts fixes the problem for real.
>
> Thanks
> Christophe
It's working! Great! I can use the RC1 on my FSL P5040. Thank you! The 
issue is definitely somewhere in the interrupt code. Please tell me the 
next steps.

- Christian
