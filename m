Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FA74EA2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:21:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0b2t1wZdz3c5K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=yunchuan@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4R0b2M5yjZz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 19:20:41 +1000 (AEST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id BFBE76062ABFD;
	Tue, 11 Jul 2023 17:20:29 +0800 (CST)
Message-ID: <c9b37dac-7f13-210b-23f7-57ece0f7d1c6@nfschina.com>
Date: Tue, 11 Jul 2023 17:20:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Intel-wired-lan] [PATCH net-next v2 00/10] Remove unnecessary
 (void*) conversions
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <f1f9002c-ccc3-a2de-e4f5-d8fa1f8734e3@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: andrew@lunn.ch, irusskikh@marvell.com, kernel-janitors@vger.kernel.org, jesse.brandeburg@intel.com, edumazet@google.com, iyappan@os.amperecomputing.com, anthony.l.nguyen@intel.com, quan@os.amperecomputing.com, qiang.zhao@nxp.com, linux@armlinux.org.uk, xeb@mail.ru, intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com, wg@grandegger.com, steve.glendinning@shawell.net, keyur@os.amperecomputing.com, linux-can@vger.kernel.org, mostrows@earthlink.net, mkl@pengutronix.de, salil.mehta@huawei.com, GR-Linux-NIC-Dev@marvell.com, uttenthaler@ems-wuensche.com, rmody@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, linuxppc-dev@lists.ozlabs.org, skalluru@marvell.com, hkallweit1@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/7/11 16:53, Paul Menzel wrote:
> Dear Su,
>
>
> Thank you for your patch.
>
> Am 10.07.23 um 08:38 schrieb Su Hui:
>> From: wuych <yunchuan@nfschina.com>
>
> Can you please write the full name correctly? Maybe Yun Chuan?
>
>     git config --global user.name "Yun Chuan"
>     git commit --amend --author="Yun Chuan <yunchuan@nfschina.com>"

Dear Paul Menzel,

Thanks for your reminder!
I have already changed this  to my full name "Wu Yunchuan".
Should I resend all these patches to change the author name?
> I only got the cover letter by the way.
> s
Maybe the network met some problems.
I will send this patchset to you separately.

Wu Yunchuan

>
> Kind regards,
>
> Paul
>
