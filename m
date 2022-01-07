Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D6486E96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 01:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVP482ncBz30FH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 11:19:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=f6fQjpoW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=quwenruo.btrfs@gmx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=f6fQjpoW; 
 dkim-atps=neutral
X-Greylist: delayed 330 seconds by postgrey-1.36 at boromir;
 Fri, 07 Jan 2022 11:19:15 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVP3R2rvRz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 11:19:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641514744;
 bh=EyPi8Y3Gc+gTu2ILQBh3edI82bKKE2zEKRdiyUFahW4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=f6fQjpoWAZtZ3bTC3ttU7oRM71zxarXaRNGOFvakmye6wOeX/o/FYCDJZblf+AJr9
 VS1qfmKyPiUVRmXWDY0x87gUu7rGXBr33rdmOO4sQ9bqn8VJwP3LtnDXdPdT0pswi4
 PA1hb1YiKxmFWwQPPR/LwtFoAwoW4EXljTZBdpgA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MStCe-1mxUEN0uR4-00UK15; Fri, 07
 Jan 2022 01:13:10 +0100
Message-ID: <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
Date: Fri, 7 Jan 2022 08:13:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Content-Language: en-US
To: Neal Gompa <ngompa13@gmail.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
 <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
In-Reply-To: <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:anCYYKhzpZMxqykyFCq+8YxKtyr10cQ84WLxzimaPuneijGdCqz
 DCTt+qxKufcuCSCYh5BvF0kfQ7B0Ov4gS934FXjKQjR28CPsyZEYGntV8kpnaTxozhsyQRC
 PmkBHzOARVbxjBbf8Gsxv62DXHnI2kJv+jLn2ZfjzaKplUnXZJaOCfBKAPin1Ic1yimFXpN
 iHdKDG80XWbzbUv4D+TQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/XiueiDLzmo=:DyLgDEzc1bS6uoCMd3pKaE
 nu20UT8/Gr1E9Dw3cqLjfb6DChegSoY/HMAcisopK7RY4NL6x3FwY/EwLJJLAFwmzzM5QKvW7
 OebA20FB4eV6lGz5RE2+SfvOpfmwzmdirbsscf2MOsnlC6jKQcmcUUKH1X2xkO/cbkHL4sPxv
 XOASNmxpn+bCX+ULWpL6QjYAzi4dcOCspIjlOcxRoIeWRzDdU/3b1U+pxx/Xc6GOouIYghGP8
 j8a6TGhyBswn9oaF1D7AdBsp1Hs+eMDcp2urCGrBY7+YEQgS86acYywPnqdVVzstbStKffPl+
 Ua62O24XV2JVm/w1J38bnh/8I9VXWmjyxFFuEGev82haCdqwCdQXre3W3zVJhPwntbP+lrMmb
 ewu1Wupj16d1Rqkh+uQ/wN9qirgFvZcRoZymP9DbhFF6zUOMkrBQ3FY41w91zBFJb9emq8RKi
 1dieGTlKA4sh/r8GmkoxxK04GBuJBIz94BnZM4ZKLIa6WC3KPRvn8januseX7f177fHoKzgyS
 okc/Qg6sdzeGWGwx3RA8RaFvBS6A8hpCDVBJkGIoQgHmUWmRotYqwQ52F8Poa5TxMLFzCuXXs
 K6HI965l2hRWRTgDKRNBFuc3OR0Ii/VKbhvl6m/POEkO4H+3lFHJtXO/lS3uHgveE//HcuIRy
 YcN1RbeqneGn26oGSXd+4DU1HoQ0s6syHtbAajcSNZoIqoR5DPPOeN2HZ2HU1H7ve7MxlQzef
 GMnUDBY8koLgGLP9jwCcF+WcOnFVwAz7FjTulZlDhXld/QvmG4LXVkQxbdBnT5DFz2ol0GmyW
 lK+6dKUy97BWHIA4nvP4WRfTUbGw0ZWWIHycLN+IFLvO2UU3vYg0MwWZpT9n0+GVFMpwXKPIP
 5ohPg41DuJQpWVJHnz68wD/xT8k56SjVJHXdNPq9pNbRvdaMEIhcR/KGVCH9ZFlCUwbQiU73e
 ys1Q7rz7J2xwQUQixF8VKp5X4wI1zf/3EtpIEnlrkWxGiS+9omTd98gYZQhbK3dpGsH9ajvJf
 J2iw8z0FRcDmPjodQhXggVd1Gg5r1lHQ0eF1NmD6XjLJuy5m8DChNSSa0bRWN0Hc4MfxCE4KY
 5GM56UOf0Tea/M=
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
Cc: linux-hexagon@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2022/1/7 00:31, Neal Gompa wrote:
> On Wed, Jan 5, 2022 at 7:05 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>
>> Hi Christophe,
>>
>> I'm recently enhancing the subpage support for btrfs, and my current
>> branch should solve the problem for btrfs to support larger page sizes.
>>
>> But unfortunately my current test environment can only provide page siz=
e
>> with 64K or 4K, no 16K or 128K/256K support.
>>
>> Mind to test my new branch on 128K page size systems?
>> (256K page size support is still lacking though, which will be addresse=
d
>> in the future)
>>
>> https://github.com/adam900710/linux/tree/metadata_subpage_switch
>>
>
> The Linux Asahi folks have a 16K page environment (M1 Macs)...

Su Yue kindly helped me testing 16K page size, and it's pretty OK there.

So I'm not that concerned.

It's 128K page size that I'm a little concerned, and I have not machine
supporting that large page size to do the test.

Thanks,
Qu

>
> Hector, could you look at it too?
>
>
>
