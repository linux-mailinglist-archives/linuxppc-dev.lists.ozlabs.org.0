Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F5660BEB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 03:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpkZd5Sy2z3cdg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 13:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpkZ5662Sz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 13:25:01 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pDytD-001M0C-Hf; Sat, 07 Jan 2023 03:24:55 +0100
Received: from p57bd9807.dip0.t-ipconnect.de ([87.189.152.7] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pDytD-002QBV-7n; Sat, 07 Jan 2023 03:24:55 +0100
Message-ID: <2a0071c6-20cf-42f2-f708-60c273fdb316@physik.fu-berlin.de>
Date: Sat, 7 Jan 2023 03:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 0/7] Remove three Sun net drivers
Content-Language: en-US
To: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
 netdev@vger.kernel.org
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
 <800d35d9-4ced-052e-aebe-683f431356ae@physik.fu-berlin.de>
 <50dfdff7-81c7-ab40-a6c5-e5e73959b780@intel.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <50dfdff7-81c7-ab40-a6c5-e5e73959b780@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.152.7
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/7/23 03:04, Anirudh Venkataramanan wrote:
> On 1/6/2023 5:36 PM, John Paul Adrian Glaubitz wrote:
>> Hello!
>>
>> On 1/6/23 23:00, Anirudh Venkataramanan wrote:
>>> This series removes the Sun Cassini, LDOM vswitch and sunvnet drivers.
>>
>> This would affect a large number of Linux on SPARC users. Please don't!
> 
> Thanks for chiming in. Does your statement above apply to all 3 drivers?

Yes!

>> We're still maintaining an active sparc64 port for Debian, see [1]. So
>> does Gentoo [2].
>>
>>> In a recent patch series that touched these drivers [1], it was suggested
>>> that these drivers should be removed completely. git logs suggest that
>>> there hasn't been any significant feature addition, improvement or fixes
>>> to user-visible bugs in a while. A web search didn't indicate any recent
>>> discussions or any evidence that there are users out there who care about
>>> these drivers.
>>
>> Well, these drivers just work and I don't see why there should be regular
>> discussions about them or changes.
> 
> That's fair, but lack of discussion can also be signs of disuse, and that's
> really the hunch I was following up on. Given what you and Karl have said,
> I agree that we shouldn't remove these drivers. I'll stop pursuing this unless
> there are new arguments to the contrary.

It's a common problem in my opinion on the LKML that many kernel developers assume
that users of certain drivers and kernel subsystems are present and active on the
kernel mailing lists to be able to raise their voices in these discussions.

If you want to find out whether some parts of the kernel are actively being used,
it's better to ask on distribution mailing lists because it's way more likely
to find any users there.

I try to be present on as many kernel mailing lists as I can to be able to answer
these questions, but sometimes there is just too much traffic for me to handle.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

