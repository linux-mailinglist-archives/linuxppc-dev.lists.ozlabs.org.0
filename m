Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0F1D758A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 12:48:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QbN40fJ5zDqS5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:48:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.79;
 helo=cmccmta1.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 49QbKv01jMzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 20:46:38 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee45ec26770cf2-373df;
 Mon, 18 May 2020 18:46:08 +0800 (CST)
X-RM-TRANSID: 2ee45ec26770cf2-373df
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.146.121] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95ec2676e50b-b7d11;
 Mon, 18 May 2020 18:46:07 +0800 (CST)
X-RM-TRANSID: 2ee95ec2676e50b-b7d11
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix format and unused assignment
To: Mark Brown <broonie@kernel.org>
References: <20200518074405.14880-1-tangbin@cmss.chinamobile.com>
 <20200518102513.GA8699@sirena.org.uk>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <9ab0ef1f-6acf-ac5a-9d16-e00fbb39ae11@cmss.chinamobile.com>
Date: Mon, 18 May 2020 18:47:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518102513.GA8699@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2020/5/18 18:25, Mark Brown wrote:
> On Mon, May 18, 2020 at 03:44:05PM +0800, Tang Bin wrote:
>> In the function fsl_micfil_startup(), the two lines of dev_err()
>> can be shortened to one line. And delete unused initialized value
>> of 'ret', because it will be assigned by the function
>> fsl_micfil_set_mclk_rate().
> This is two separate changes with no overlap so would have been better
> sent as separate patches.

Got it, Thanks

Tang Bin



