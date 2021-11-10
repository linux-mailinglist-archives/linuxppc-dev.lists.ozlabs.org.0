Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94544BAC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 05:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HprkL1LD3z30R2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 15:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rQFHfSVc;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=RYPFs49v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=opensource.wdc.com (client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com;
 envelope-from=prvs=941a94e4b=damien.lemoal@opensource.wdc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=rQFHfSVc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com
 header.a=rsa-sha256 header.s=dkim header.b=RYPFs49v; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 10 Nov 2021 14:53:26 AEDT
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HprYL04Lsz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 14:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636516404; x=1668052404;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DuAMezrT6YElGWjfcaouVYsLWg9EC32l6gp1Eic4vso=;
 b=rQFHfSVcWxj4GY0RnXMxT4IKVFTqEoM3kTV2xKMSMPUJMd/jXjy5bPGJ
 VQkYrvVNB9UXoGCvZUE31vB/HGicXZo+MdeyawiR7+J3oOE62sAvOWI2y
 26ftoAC9soekOPI37JynxwAzfnC82GKK7FBtEK2cqznOVEod5TrtW3t+2
 CxdVbuspChwJOzDmin7QInShuR0MQE1IFB76ppX2/0DrwFiLyRDo9pe1o
 yo1P/X5fXUVKfFrWSIWwsGT6knZK8Ng+lo+aolJ2G771kRuwifjh9qGWL
 mOw44AJD6kVGaX5+K8J85GQiHfmj+uz1w0ejhaSOp0P9a85ZYzUA0sYw7 w==;
X-IronPort-AV: E=Sophos;i="5.87,222,1631548800"; d="scan'208";a="189995489"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2021 11:52:14 +0800
IronPort-SDR: d+9iVRCnkHxspzrKEkcjgyPGadPDg2Ek2NBLgvyZTtV9d8Z/ADr0+S20W0llHJs6ILIOZlynSc
 MHDI2qiwAudzXazSIofRVqKEsSsukSuDSybJazx6StWKF9N+DOvcsp/sjbGfOrxssYQY3Icu0s
 Qg0X9Qe7UXGwNUiPsaK5iBPlSaADAc/yOv/J+Cusx5fclQyT4ZKRx3WQjpIwWncIQBqbnqIXfd
 /+GW991jUlD5Bh3kADbVfUzzDckfDBNaX1H1N7sos1uxNW3V++cCBCtycrb2uua9Q4esHsYznA
 znpZ3SiDXXImlmYv1tGUqw9f
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 19:27:27 -0800
IronPort-SDR: g9YX+qKOQKgjQ9Ab9mpQVdWG1i/+vsxL85zDvdiLxFz7aYz1xQHqY9ZBKPWm7vnKF+hjddO4I0
 bsWF/+OmZ5TbvuDAX2P+gmX28r4XvshjmRtC98ksKPEyMIdAxAnlcpj/jAwcog+YQ0wTEB7PsT
 BUUQI91PdZcDyXZ4VKb6RFJIduJoWLtoB0DE7jCfosMx5Y8Wf2gvkVxmJtwc85Z3BMd2B7HVXR
 gcpk7Byv+94u5E/2s9+viHgJlpK9+7cvZomT6stWarw67RifAptcGB7dS5D22dDAI+zkMZF/Ph
 cyY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 19:52:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HprX007Wcz1RtW0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 19:52:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1636516335; x=1639108336; bh=DuAMezrT6YElGWjfcaouVYsLWg9EC32l6gp
 1Eic4vso=; b=RYPFs49vzwxp0oMnq9sUK738LPySWseLC0OQhhJx9NJE9pX+fW1
 Z4y1vbS8Fvx9NlZUIwa0t5kBjprR71owWAt7cBpZEmENXFZAyM67IUiq4s2HNaF2
 IP6w6CBgXm0Pk1Fw2HWof88vKqv9lkniSyE86S84Bz8Etx6uEC5QIxCdfHOggBSr
 WHS9p6I5VljdjdGxdAt7epr/7Q/Ljsl0aXMUEkMYxPn+7dyxJj+cCJFRPXmqVGZI
 wkS+vxL9lZslFy2SMxGPKCGfc5wdQb0j+t0EUs4bEx9v9RMf7NGhoiNd0IYzkeiv
 HFToCGtzQkUwZucbvsuhL29MlGPVuOUy0qQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id tqvobb8gv_tB for <linuxppc-dev@lists.ozlabs.org>;
 Tue,  9 Nov 2021 19:52:15 -0800 (PST)
Received: from [10.89.81.216] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.81.216])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HprWw57j3z1RtVl;
 Tue,  9 Nov 2021 19:52:12 -0800 (PST)
Message-ID: <1400f0f2-9247-6540-2685-be257d9ef243@opensource.wdc.com>
Date: Wed, 10 Nov 2021 12:52:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Content-Language: en-US
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <ee3884db-da17-39e3-4010-bcc8f878e2f6@xenosoft.de>
 <20211109165848.GA1155989@bhelgaas> <YYr4x1xWfptXRmqt@rocinante>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <YYr4x1xWfptXRmqt@rocinante>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 10 Nov 2021 15:00:36 +1100
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
Cc: Jens Axboe <axboe@kernel.dk>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/11/10 7:40, Krzysztof Wilczy=C5=84ski wrote:
> [+CC Adding Jens and Damien to get their opinion about the problem at h=
and]
>=20
> Hello Jens and Damien,
>=20
> Sorry to bother both of you, but we are having a problem that most
> definitely requires someone with an extensive expertise in storage,
> as per the quoted message from Christian below:
>=20
>>>> The Nemo board [1] doesn't recognize any ATA disks with the pci-v5.1=
6
>>>> updates [2].
>>>>
>>>> Error messages:
>>>>
>>>> ata4.00: gc timeout cmd 0xec
>>>> ata4.00: failed to IDENTIFY (I/O error, error_mask=3D0x4)
>>>> ata1.00: gc timeout cmd 0xec
>>>> ata1.00: failed to IDENTIFY (I/O error, error_mask=3D0x4)
>>>> ata3.00: gc timeout cmd 0xec
>>>> ata3.00: failed to IDENTIFY (I/O error, error_mask=3D0x4)

IDENTIFY is the first command sent to a device when it is being probed. T=
his
means that at least the AHCI (is it AHCI ?) adapter found the ports and d=
rives
connected. But the qc timeout indicates that there is no response from th=
e
drive. This could be due to interrupts not being received for the command
completion. One thing to try would be to increase the identify command ti=
meout
to see things simply got slow (for whatever reason) or if indeed there is=
 no
response at all. Note that after the first timeout, normally the port is =
reset
and the command retried. That does not seem to be the case here. Weird...

Maybe try something like this:

diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 1d4a6f1e88cd..16e105bcb899 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -79,7 +79,7 @@ enum {
  * take an exceptionally long time to recover from reset.
  */
 static const unsigned long ata_eh_reset_timeouts[] =3D {
-       10000,  /* most drives spin up by 10sec */
+       30000,  /* most drives spin up by 10sec */
        10000,  /* > 99% working drives spin up before 20sec */
        35000,  /* give > 30 secs of idleness for outlier devices */
         5000,  /* and sweet one last chance */

Also note that I posted a patch a couple of days ago fixing a qc timeout =
for
read log commands during device probe. This is not what you are hitting h=
ere
though. I have not yet sent this to Linus.

https://lore.kernel.org/linux-ide/20211105073106.422623-1-damien.lemoal@o=
pensource.wdc.com/



>=20
> The error message is also not very detailed and we aren't really sure w=
hat
> the issue coming from the PCI sub-system might be causing or leading to
> this.
>=20
>>>>
>>>> I was able to revert the new pci-v5.16 updates [2]. After a new comp=
iling,
>>>> the kernel recognize all ATA disks correctly.
>>>>
>>>> Could you please check the pci-v5.16 updates [2]?
>>>>
>>>> Please find attached the kernel config.
>>>>
>>>> Thanks,
>>>> Christian
>>>>
>>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
>>
>> Sorry for the breakage, and thank you very much for the report.  Can
>> you please collect the complete dmesg logs before and after the
>> pci-v5.16 changes and the "sudo lspci -vv" output from before the
>> changes?
>>
>> You can attach them at https://bugzilla.kernel.org if you don't have
>> a better place to put them.
>>
>> You could attach the kernel config there, too, since it didn't make it
>> to the mailing list (vger may discard them -- see
>> http://vger.kernel.org/majordomo-info.html).
>=20
> Bjorn and I looked at which commits that went with a recent Pull Reques=
t
> from us might be causing this, but we are a little bit at loss, and wer=
e
> hoping that you could give us a hand in troubleshooting this.
>=20
> Thank you in advance!
>=20
> 	Krzysztof
>=20
>=20


--=20
Damien Le Moal
Western Digital Research
