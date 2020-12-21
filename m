Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 437622DFC56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 14:35:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D00p24s1LzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 00:35:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.105.233; helo=2.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo52.mail-out.ovh.net (2.mo52.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D00lL49DSzDqBM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 00:32:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id C20A122695B;
 Mon, 21 Dec 2020 14:08:02 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 21 Dec
 2020 14:08:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003342da0f8-d1ed-4d7c-a098-bf4140ed99bc,
 0B619508FA83EFFE02DCDB9DB2C04BF8DACB1B13) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Mon, 21 Dec 2020 14:07:59 +0100
From: Greg Kurz <groug@kaod.org>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC Qemu PATCH v2 0/2] spapr: nvdimm: Asynchronus flush hcall
 support
Message-ID: <20201221140759.24930917@bahia.lan>
In-Reply-To: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
References: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a924b426-9b24-4c28-b578-02054eb1d407
X-Ovh-Tracer-Id: 11399173607988763067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehtdefveevfeeuudejteekhfdtgeduleeutedukefhleekieekjedvieelheejheenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 linux-nvdimm@lists.01.org, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 09:16:14 -0600
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> The nvdimm devices are expected to ensure write persistent during power
> failure kind of scenarios.
> 
> The libpmem has architecture specific instructions like dcbf on power
> to flush the cache data to backend nvdimm device during normal writes.
> 
> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> doesn't traslate to actual flush to the backend file on the host in case
> of file backed vnvdimms. This is addressed by virtio-pmem in case of x86_64
> by making asynchronous flushes.
> 
> On PAPR, issue is addressed by adding a new hcall to
> request for an explicit asynchronous flush requests from the guest ndctl
> driver when the backend nvdimm cannot ensure write persistence with dcbf
> alone. So, the approach here is to convey when the asynchronous flush is
> required in a device tree property. The guest makes the hcall when the
> property is found, instead of relying on dcbf.
> 
> The first patch adds the necessary asynchronous hcall support infrastructure
> code at the DRC level. Second patch implements the hcall using the
> infrastructure.
> 
> Hcall semantics are in review and not final.
> 
> A new device property sync-dax is added to the nvdimm device. When the 
> sync-dax is off(default), the asynchronous hcalls will be called.
> 
> With respect to save from new qemu to restore on old qemu, having the
> sync-dax by default off(when not specified) causes IO errors in guests as
> the async-hcall would not be supported on old qemu. The new hcall
> implementation being supported only on the new  pseries machine version,
> the current machine version checks may be sufficient to prevent
> such migration. Please suggest what should be done.
> 

First, all requests that are still not completed from the guest POV,
ie. the hcall hasn't returned H_SUCCESS yet, are state that we should
migrate in theory. In this case, I guess we rather want to drain all
pending requests on the source in some pre-save handler.

Then, as explained in another mail, you should enforce stable behavior
for existing machine types with some hw_compat magic.

> The below demonstration shows the map_sync behavior with sync-dax on & off.
> (https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)
> 
> The pmem0 is from nvdimm with With sync-dax=on, and pmem1 is from nvdimm with syn-dax=off, mounted as
> /dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
> /dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
> 
> [root@atest-guest ~]# ./mapsync /mnt1/newfile    ----> When sync-dax=off
> [root@atest-guest ~]# ./mapsync /mnt2/newfile    ----> when sync-dax=on
> Failed to mmap  with Operation not supported
> 
> ---
> v1 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06330.html
> Changes from v1
>       - Fixed a missed-out unlock
>       - using QLIST_FOREACH instead of QLIST_FOREACH_SAFE while generating token
> 
> Shivaprasad G Bhat (2):
>       spapr: drc: Add support for async hcalls at the drc level
>       spapr: nvdimm: Implement async flush hcalls
> 
> 
>  hw/mem/nvdimm.c            |    1
>  hw/ppc/spapr_drc.c         |  146 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/ppc/spapr_nvdimm.c      |   79 ++++++++++++++++++++++++
>  include/hw/mem/nvdimm.h    |   10 +++
>  include/hw/ppc/spapr.h     |    3 +
>  include/hw/ppc/spapr_drc.h |   25 ++++++++
>  6 files changed, 263 insertions(+), 1 deletion(-)
> 
> --
> Signature
> 
> 

