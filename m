Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFBABDAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 18:26:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q2y34H5VzDrDg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 02:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="wAmzyE0c"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q2w268bWzDr7l
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2019 02:25:06 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 25667435E8;
 Fri,  6 Sep 2019 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1567787100; x=
 1569601501; bh=hiRE2LVI+vmSqJcj78rqU0My4zLsyfjTb5I5USRMW8o=; b=w
 AmzyE0chAr2Opb+Yj4lxJfOLkr6yy2+rtf3uMTzJ9vIbAYfp07gQHfkEK5PCtmyC
 4RS7JAgBkD3weeg3B82qZjTC9eYG6li5/qWc3+bbjWKrx7w9hsSy4lNZi9xgAO/N
 gF7IeW69a9fPgpFsrjcJ8cRYWguNIRx4vtG8Hy7XoI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29sdLR9j-h_N; Fri,  6 Sep 2019 19:25:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E9723435C9;
 Fri,  6 Sep 2019 19:25:00 +0300 (MSK)
Received: from [172.17.15.60] (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 6 Sep
 2019 19:25:00 +0300
Subject: Re: [PATCH v5 18/23] powerpc/pci: Handle BAR movement
To: Oliver O'Halloran <oohall@gmail.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
 <20190816165101.911-19-s.miroshnichenko@yadro.com>
 <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=s.miroshnichenko@yadro.com; prefer-encrypt=mutual; keydata=
 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
 lHi50np+KDDPzZS51tw=
Message-ID: <7af3d4cd-b786-19b1-1ddf-b93f9875976d@yadro.com>
Date: Fri, 6 Sep 2019 19:24:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7kvl1c4AtOwSxnxgLHYNFgH7rCYaNfvwx"
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--7kvl1c4AtOwSxnxgLHYNFgH7rCYaNfvwx
Content-Type: multipart/mixed; boundary="7aDBJshdKTT72tMTzGTwFl01ETxIEOLbj";
 protected-headers="v1"
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Message-ID: <7af3d4cd-b786-19b1-1ddf-b93f9875976d@yadro.com>
Subject: Re: [PATCH v5 18/23] powerpc/pci: Handle BAR movement
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
 <20190816165101.911-19-s.miroshnichenko@yadro.com>
 <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>
In-Reply-To: <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>

--7aDBJshdKTT72tMTzGTwFl01ETxIEOLbj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On 9/4/19 8:37 AM, Oliver O'Halloran wrote:
> On Fri, 2019-08-16 at 19:50 +0300, Sergey Miroshnichenko wrote:
>> Add pcibios_rescan_prepare()/_done() hooks for the powerpc platform. N=
ow if
>> the device's driver supports movable BARs, pcibios_rescan_prepare() wi=
ll be
>> called after the device is stopped, and pcibios_rescan_done() - before=
 it
>> resumes. There are no memory requests to this device between the hooks=
, so
>> it it safe to rebuild the EEH address cache during that.
>>
>> CC: Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
>> ---
>>  arch/powerpc/kernel/pci-hotplug.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/p=
ci-hotplug.c
>> index 0b0cf8168b47..18cf13bba228 100644
>> --- a/arch/powerpc/kernel/pci-hotplug.c
>> +++ b/arch/powerpc/kernel/pci-hotplug.c
>> @@ -144,3 +144,13 @@ void pci_hp_add_devices(struct pci_bus *bus)
>>  	pcibios_finish_adding_to_bus(bus);
>>  }
>>  EXPORT_SYMBOL_GPL(pci_hp_add_devices);
>> +
>> +void pcibios_rescan_prepare(struct pci_dev *pdev)
>> +{
>> +	eeh_addr_cache_rmv_dev(pdev);
>> +}
>> +
>> +void pcibios_rescan_done(struct pci_dev *pdev)
>> +{
>> +	eeh_addr_cache_insert_dev(pdev);
>> +}
>=20
> Is this actually sufficent? The PE number for a device is largely
> determined by the location of the MMIO BARs. If you move a BAR far
> enough the PE number stored in the eeh_pe would need to be updated as
> well.
>=20

Thanks for the hint! I've checked on our PowerNV: for bridges with MEM
only it allocates PE numbers starting from 0xff down, and when there
are MEM64 - starting from 0 up, one PE number per 4GiB.

PEs are allocated during call to pnv_pci_setup_bridge(), and the I've
added invocation of pci_setup_bridge() after a hotplug event in the
"Recalculate all bridge windows during rescan" patch of this series.

Currently, if a bus already has a PE, pnv_ioda_setup_bus_PE() takes it
and returns. I can see two ways to change it, both are not difficult to
implement:

 a.1) check if MEM64 BARs appeared below the bus - allocate and assign
      a new master PE with required number of slave PEs;

 a.2) if the bus now has more MEM64 than before - check if more slave
      PEs must be reserved;

 b) release all the PEs before a PCI rescan and allocate+assign them
    again after - with this approach the "Hook up the writes to
    PCI_SECONDARY_BUS register" patch may be eliminated.

Do you find any of these suitable?

Serge


--7aDBJshdKTT72tMTzGTwFl01ETxIEOLbj--

--7kvl1c4AtOwSxnxgLHYNFgH7rCYaNfvwx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEHW7T7ovP/cFp8+b3DHQ+aNFTs7UFAl1yiFwACgkQDHQ+aNFT
s7W8bRAAjzKFcP++w2fUrtHBJJRfDB4kZBRCRtC/COyaTBQOI/kbogi1T2Q0CTyJ
fmDu6MYyLHgGs3mKJj5njJQUrF0vSGlQqWGx1osTn330BSJvQcbCldUl65Nf6lnJ
7AqGbL8zumpeJ//VxBuK60BbIHz4DSFf0GdUEcmlqg8k0QNQGIrcyCU3lrIOoXnb
KH02sr1DnZajeS1L2ncaPDBKnlXO2BcRsZD6xaxBkGlbCWVkOCHWssXVr1GFBJEd
QsneIl4mF4CCR04uAZZbWMyvdVUEjQdybfDq8YSVPSitw2zKt/2ZsmVtlxaGgXfD
Y6b8Tv3QGras4enYim7QA8jxLYm2aQmBgBX16a8wwK2czMlElN7VXzoKrhGWtold
TnQE8+f3bIy17psgYD8Cs4yhUDfGOwJnn8MSg2PsuEsSBI7SQMCq3HzLTwxohowd
mM6D4sAxtPu9+9YnAPpakQtVo5ME8fSiCQGWMmLcIOmoR7cNKlxYnkPkAXf+VS5m
83ekWSN6O3oyePx8rPU5NnC0AAZmyV9qPitmvyrQ70/3gNNneNc3awxgpvAli4WD
d6F+9srTOqFjCkhnVLs6scB4QUHu4kMRmVeSCRpvOhjSm3RvlZRtfzkJ66ngA8pB
Ai2nvKV4TnDXokAk4j60H5KzNmPNfz4ZF/+Khi82PPVnrCHCMso=
=SJpO
-----END PGP SIGNATURE-----

--7kvl1c4AtOwSxnxgLHYNFgH7rCYaNfvwx--
