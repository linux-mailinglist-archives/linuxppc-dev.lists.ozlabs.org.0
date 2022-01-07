Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29364870CF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:56:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVSXS44lyz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:56:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=marcan.st (client-ip=2a01:298:fe:f::2; helo=mail.marcansoft.com;
 envelope-from=marcan@marcan.st; receiver=<UNKNOWN>)
X-Greylist: delayed 594 seconds by postgrey-1.36 at boromir;
 Fri, 07 Jan 2022 13:55:46 AEDT
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVSX229Pmz30FH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:55:45 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 70AEA43320;
 Fri,  7 Jan 2022 02:45:40 +0000 (UTC)
Message-ID: <d8cd9082-4514-9c6c-85c7-418356f1f66d@marcan.st>
Date: Fri, 7 Jan 2022 11:45:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Content-Language: en-US
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Neal Gompa <ngompa13@gmail.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
 <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
 <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-hexagon@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/01/07 9:13, Qu Wenruo wrote:
> 
> 
> On 2022/1/7 00:31, Neal Gompa wrote:
>> On Wed, Jan 5, 2022 at 7:05 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>
>>> Hi Christophe,
>>>
>>> I'm recently enhancing the subpage support for btrfs, and my current
>>> branch should solve the problem for btrfs to support larger page sizes.
>>>
>>> But unfortunately my current test environment can only provide page size
>>> with 64K or 4K, no 16K or 128K/256K support.
>>>
>>> Mind to test my new branch on 128K page size systems?
>>> (256K page size support is still lacking though, which will be addressed
>>> in the future)
>>>
>>> https://github.com/adam900710/linux/tree/metadata_subpage_switch
>>>
>>
>> The Linux Asahi folks have a 16K page environment (M1 Macs)...
> 
> Su Yue kindly helped me testing 16K page size, and it's pretty OK there.
> 
> So I'm not that concerned.
> 
> It's 128K page size that I'm a little concerned, and I have not machine
> supporting that large page size to do the test.
> 
> Thanks,
> Qu

I'm happy to test things on 16K in the future if you need me to :-)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
