Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C514277A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 10:41:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481RWT5DvYzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 20:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::9;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=F6lWAaQ+; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481R0H0Ht2zDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 20:17:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579511859;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=qSUjC69zK2oDdbl4JMNMSrLxeZA2bP7y3B61tKmaYIY=;
 b=F6lWAaQ+EACTa7P0EsGMNwgSjCCVyn1lWlUh37kPLDJTbpY3xnrm4lvhouoeKGacuE
 53i/NMVzVlPdEJeMfL4nLjdU7cSIfYFKIj8dHOGm60typPAjnbFv3riANTkvyzsNVJoZ
 t5ndwVHALVQx/NJLUDPBEfl5SMIKmyazvik7WxfgaGMuNzE3Q9ranOHuTfI/EkjO3ETY
 0KNfso7GbVz7TAF32o7pe35/38/yYmCiXEvmYaN88VIxQBjPQtIQDIRyIYRyEzF4aTqZ
 U2QvSpDHDuLLr5aBttObqfxMC4QHF2V7E7s2gSv63faPiJiapoDqkGIeQkIpZqXKbZZJ
 5Q/Q==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySd+h5FvloCR9QVidlQfU="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.37] by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
 with ESMTPSA id c05c1aw0K9HVw9R
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 20 Jan 2020 10:17:31 +0100 (CET)
Subject: [FSL P5020 P5040 PPC] Onboard SD card doesn't work anymore after the
 'mmc-v5.4-2' updates
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <fda179eb-df5f-ba87-aaf0-524fffca745b@xenosoft.de>
Date: Mon, 20 Jan 2020 10:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 16.01.20 um 16:46 schrieb Ulf Hansson:
> On Thu, 16 Jan 2020 at 12:18, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> Hi All,
>>
>> We still need the attached patch for our onboard SD card interface
>> [1,2]. Could you please add this patch to the tree?
> No, because according to previous discussion that isn't the correct
> solution and more importantly it will break other archs (if I recall
> correctly).
>
> Looks like someone from the ppc community needs to pick up the ball.
I am not sure if the ppc community have to fix this issue because your 
updates (mmc-v5.4-2) are responsible for this issue. If nobody wants to 
fix this issue then we will lost the onboard SD card support in the 
future. PLEASE check the 'mmc-v5.4-2' updates again.
>
>> Thanks,
>> Christian
>>
>> [1] https://www.spinics.net/lists/linux-mmc/msg56211.html
> I think this discussion even suggested some viable solutions, so it
> just be a matter of sending a patch :-)
>
>> [2]
>> http://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4349&start=20#p49012
>>
> Kind regards
> Uffe

