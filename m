Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A60CBBE7E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 23:48:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dsBL0KgwzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 07:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="a0gOZH8Q"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ds8K5YTqzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 07:46:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBvcjF7zDDxpnQNxilxomsaKbhuVkdJJJLolhmHxeds=; b=a0gOZH8QPRAVwGfE0sU/Xp6s4
 8eK4FqO9HNDsI/FSg3GHxkg/XXyIS/W7mu3cEgy1vGjGhHQeSO7vNQoqyj6rPg8OYdNr1cZ0APVHq
 H6Fmlj//gmirtVogemTFDzKvO0GURtNZjas80D0cmjapUQfNAQLOImLW3WIcphjy7y/Ugabg7wtks
 3Re2oF5IJ73PPMvqfCgAFtq+z7OlQClV1TK4ENdQfxwb4VZgJFcU4FIj56FGNI6DGWdCh7GNNYKG+
 00kk2Ji/KuNBt/dIQ8CAJt9T+2SO4QhTUD7g5R8ehYnn+23wSH8FEgluu2UEbWgpLpoc+z4Ieocp4
 9LlLCWMDA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDF6H-0007v7-QN; Wed, 25 Sep 2019 21:45:30 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 86F40980189; Wed, 25 Sep 2019 23:45:26 +0200 (CEST)
Date: Wed, 25 Sep 2019 23:45:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190925214526.GA4643@worktop.programming.kicks-ass.net>
References: <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925163154.GF4553@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org,
 Yunsheng Lin <linyunsheng@huawei.com>, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 06:31:54PM +0200, Peter Zijlstra wrote:
> On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> > I am sorry but I still do not understand why you consider this whack a
> > mole better then simply live with the fact that NUMA_NO_NODE is a
> > reality and that using the full cpu mask is a reasonable answer to that.
> 
> Because it doesn't make physical sense. A device _cannot_ be local to
> all CPUs in a NUMA system.

The below patch still gives a fair amount of noise on my fairly old and
cruft IVB-EP, but it gets rid of most of the simple stuff.

[    2.890739] [Firmware Bug]: device: 'platform': no node assigned on NUMA capable HW
[    2.901855] [Firmware Bug]: device: 'vtcon0': no node assigned on NUMA capable HW
[    2.911804] [Firmware Bug]: device: 'id': no node assigned on NUMA capable HW
[    3.800832] [Firmware Bug]: device: 'fbcon': no node assigned on NUMA capable HW
[    4.824808] [Firmware Bug]: device: 'LNXSYSTM:00': no node assigned on NUMA capable HW
[    5.112739] [Firmware Bug]: device: 'pci0000:00': no node assigned on NUMA capable HW
[    6.703425] [Firmware Bug]: device: 'pci0000:80': no node assigned on NUMA capable HW
[    7.049515] [Firmware Bug]: device: 'ACPI0004:00': no node assigned on NUMA capable HW
[    7.078823] [Firmware Bug]: device: 'ACPI0004:01': no node assigned on NUMA capable HW
[    7.149889] [Firmware Bug]: device: 'pci0000:7f': no node assigned on NUMA capable HW
[    7.158798] [Firmware Bug]: device: '0000:7f': no node assigned on NUMA capable HW
[    7.183796] [Firmware Bug]: device: '0000:7f:08.0': no node assigned on NUMA capable HW
[    7.199796] [Firmware Bug]: device: '0000:7f:09.0': no node assigned on NUMA capable HW
[    7.215792] [Firmware Bug]: device: '0000:7f:0a.0': no node assigned on NUMA capable HW
[    7.231791] [Firmware Bug]: device: '0000:7f:0a.1': no node assigned on NUMA capable HW
[    7.247793] [Firmware Bug]: device: '0000:7f:0a.2': no node assigned on NUMA capable HW
[    7.262794] [Firmware Bug]: device: '0000:7f:0a.3': no node assigned on NUMA capable HW
[    7.278789] [Firmware Bug]: device: '0000:7f:0b.0': no node assigned on NUMA capable HW
[    7.294787] [Firmware Bug]: device: '0000:7f:0b.3': no node assigned on NUMA capable HW
[    7.310794] [Firmware Bug]: device: '0000:7f:0c.0': no node assigned on NUMA capable HW
[    7.325796] [Firmware Bug]: device: '0000:7f:0c.1': no node assigned on NUMA capable HW
[    7.341790] [Firmware Bug]: device: '0000:7f:0c.2': no node assigned on NUMA capable HW
[    7.357789] [Firmware Bug]: device: '0000:7f:0c.3': no node assigned on NUMA capable HW
[    7.373789] [Firmware Bug]: device: '0000:7f:0c.4': no node assigned on NUMA capable HW
[    7.388789] [Firmware Bug]: device: '0000:7f:0d.0': no node assigned on NUMA capable HW
[    7.404791] [Firmware Bug]: device: '0000:7f:0d.1': no node assigned on NUMA capable HW
[    7.420789] [Firmware Bug]: device: '0000:7f:0d.2': no node assigned on NUMA capable HW
[    7.436790] [Firmware Bug]: device: '0000:7f:0d.3': no node assigned on NUMA capable HW
[    7.451789] [Firmware Bug]: device: '0000:7f:0d.4': no node assigned on NUMA capable HW
[    7.467799] [Firmware Bug]: device: '0000:7f:0e.0': no node assigned on NUMA capable HW
[    7.483797] [Firmware Bug]: device: '0000:7f:0e.1': no node assigned on NUMA capable HW
[    7.499830] [Firmware Bug]: device: '0000:7f:0f.0': no node assigned on NUMA capable HW
[    7.515825] [Firmware Bug]: device: '0000:7f:0f.1': no node assigned on NUMA capable HW
[    7.530823] [Firmware Bug]: device: '0000:7f:0f.2': no node assigned on NUMA capable HW
[    7.546824] [Firmware Bug]: device: '0000:7f:0f.3': no node assigned on NUMA capable HW
[    7.562823] [Firmware Bug]: device: '0000:7f:0f.4': no node assigned on NUMA capable HW
[    7.578822] [Firmware Bug]: device: '0000:7f:0f.5': no node assigned on NUMA capable HW
[    7.594830] [Firmware Bug]: device: '0000:7f:10.0': no node assigned on NUMA capable HW
[    7.609834] [Firmware Bug]: device: '0000:7f:10.1': no node assigned on NUMA capable HW
[    7.625825] [Firmware Bug]: device: '0000:7f:10.2': no node assigned on NUMA capable HW
[    7.641824] [Firmware Bug]: device: '0000:7f:10.3': no node assigned on NUMA capable HW
[    7.657825] [Firmware Bug]: device: '0000:7f:10.4': no node assigned on NUMA capable HW
[    7.673824] [Firmware Bug]: device: '0000:7f:10.5': no node assigned on NUMA capable HW
[    7.689792] [Firmware Bug]: device: '0000:7f:10.6': no node assigned on NUMA capable HW
[    7.704825] [Firmware Bug]: device: '0000:7f:10.7': no node assigned on NUMA capable HW
[    7.720791] [Firmware Bug]: device: '0000:7f:13.0': no node assigned on NUMA capable HW
[    7.736793] [Firmware Bug]: device: '0000:7f:13.1': no node assigned on NUMA capable HW
[    7.752791] [Firmware Bug]: device: '0000:7f:13.4': no node assigned on NUMA capable HW
[    7.767780] [Firmware Bug]: device: '0000:7f:13.5': no node assigned on NUMA capable HW
[    7.783793] [Firmware Bug]: device: '0000:7f:13.6': no node assigned on NUMA capable HW
[    7.799790] [Firmware Bug]: device: '0000:7f:16.0': no node assigned on NUMA capable HW
[    7.815789] [Firmware Bug]: device: '0000:7f:16.1': no node assigned on NUMA capable HW
[    7.831795] [Firmware Bug]: device: '0000:7f:16.2': no node assigned on NUMA capable HW
[    7.882888] [Firmware Bug]: device: 'pci0000:ff': no node assigned on NUMA capable HW
[    7.891785] [Firmware Bug]: device: '0000:ff': no node assigned on NUMA capable HW
[    7.916800] [Firmware Bug]: device: '0000:ff:08.0': no node assigned on NUMA capable HW
[    7.932798] [Firmware Bug]: device: '0000:ff:09.0': no node assigned on NUMA capable HW
[    7.948795] [Firmware Bug]: device: '0000:ff:0a.0': no node assigned on NUMA capable HW
[    7.964800] [Firmware Bug]: device: '0000:ff:0a.1': no node assigned on NUMA capable HW
[    7.979794] [Firmware Bug]: device: '0000:ff:0a.2': no node assigned on NUMA capable HW
[    7.995799] [Firmware Bug]: device: '0000:ff:0a.3': no node assigned on NUMA capable HW
[    8.011809] [Firmware Bug]: device: '0000:ff:0b.0': no node assigned on NUMA capable HW
[    8.027793] [Firmware Bug]: device: '0000:ff:0b.3': no node assigned on NUMA capable HW
[    8.042793] [Firmware Bug]: device: '0000:ff:0c.0': no node assigned on NUMA capable HW
[    8.058793] [Firmware Bug]: device: '0000:ff:0c.1': no node assigned on NUMA capable HW
[    8.074804] [Firmware Bug]: device: '0000:ff:0c.2': no node assigned on NUMA capable HW
[    8.090794] [Firmware Bug]: device: '0000:ff:0c.3': no node assigned on NUMA capable HW
[    8.105793] [Firmware Bug]: device: '0000:ff:0c.4': no node assigned on NUMA capable HW
[    8.121800] [Firmware Bug]: device: '0000:ff:0d.0': no node assigned on NUMA capable HW
[    8.137805] [Firmware Bug]: device: '0000:ff:0d.1': no node assigned on NUMA capable HW
[    8.153795] [Firmware Bug]: device: '0000:ff:0d.2': no node assigned on NUMA capable HW
[    8.169797] [Firmware Bug]: device: '0000:ff:0d.3': no node assigned on NUMA capable HW
[    8.184796] [Firmware Bug]: device: '0000:ff:0d.4': no node assigned on NUMA capable HW
[    8.200802] [Firmware Bug]: device: '0000:ff:0e.0': no node assigned on NUMA capable HW
[    8.216803] [Firmware Bug]: device: '0000:ff:0e.1': no node assigned on NUMA capable HW
[    8.232832] [Firmware Bug]: device: '0000:ff:0f.0': no node assigned on NUMA capable HW
[    8.248821] [Firmware Bug]: device: '0000:ff:0f.1': no node assigned on NUMA capable HW
[    8.263833] [Firmware Bug]: device: '0000:ff:0f.2': no node assigned on NUMA capable HW
[    8.279830] [Firmware Bug]: device: '0000:ff:0f.3': no node assigned on NUMA capable HW
[    8.295829] [Firmware Bug]: device: '0000:ff:0f.4': no node assigned on NUMA capable HW
[    8.311830] [Firmware Bug]: device: '0000:ff:0f.5': no node assigned on NUMA capable HW
[    8.327834] [Firmware Bug]: device: '0000:ff:10.0': no node assigned on NUMA capable HW
[    8.342830] [Firmware Bug]: device: '0000:ff:10.1': no node assigned on NUMA capable HW
[    8.358829] [Firmware Bug]: device: '0000:ff:10.2': no node assigned on NUMA capable HW
[    8.374830] [Firmware Bug]: device: '0000:ff:10.3': no node assigned on NUMA capable HW
[    8.390837] [Firmware Bug]: device: '0000:ff:10.4': no node assigned on NUMA capable HW
[    8.406831] [Firmware Bug]: device: '0000:ff:10.5': no node assigned on NUMA capable HW
[    8.421842] [Firmware Bug]: device: '0000:ff:10.6': no node assigned on NUMA capable HW
[    8.437830] [Firmware Bug]: device: '0000:ff:10.7': no node assigned on NUMA capable HW
[    8.453795] [Firmware Bug]: device: '0000:ff:13.0': no node assigned on NUMA capable HW
[    8.469794] [Firmware Bug]: device: '0000:ff:13.1': no node assigned on NUMA capable HW
[    8.485796] [Firmware Bug]: device: '0000:ff:13.4': no node assigned on NUMA capable HW
[    8.500797] [Firmware Bug]: device: '0000:ff:13.5': no node assigned on NUMA capable HW
[    8.516795] [Firmware Bug]: device: '0000:ff:13.6': no node assigned on NUMA capable HW
[    8.532794] [Firmware Bug]: device: '0000:ff:16.0': no node assigned on NUMA capable HW
[    8.548794] [Firmware Bug]: device: '0000:ff:16.1': no node assigned on NUMA capable HW
[    8.563777] [Firmware Bug]: device: '0000:ff:16.2': no node assigned on NUMA capable HW
[    8.668308] [Firmware Bug]: device: 'mc': no node assigned on NUMA capable HW
[    8.758913] [Firmware Bug]: device: 'lo': no node assigned on NUMA capable HW
[    8.767975] [Firmware Bug]: device: 'wmi_bus-PNP0C14:00': no node assigned on NUMA capable HW
[    9.065753] [Firmware Bug]: device: 'pnp0': no node assigned on NUMA capable HW
[   11.220722] [Firmware Bug]: device: 'cooling_device0': no node assigned on NUMA capable HW
[   11.240495] [Firmware Bug]: device: 'cooling_device1': no node assigned on NUMA capable HW
[   11.260546] [Firmware Bug]: device: 'cooling_device2': no node assigned on NUMA capable HW
[   11.280271] [Firmware Bug]: device: 'cooling_device3': no node assigned on NUMA capable HW
[   11.300384] [Firmware Bug]: device: 'cooling_device4': no node assigned on NUMA capable HW
[   11.320479] [Firmware Bug]: device: 'cooling_device5': no node assigned on NUMA capable HW
[   11.340206] [Firmware Bug]: device: 'cooling_device6': no node assigned on NUMA capable HW
[   11.360185] [Firmware Bug]: device: 'cooling_device7': no node assigned on NUMA capable HW
[   11.379938] [Firmware Bug]: device: 'cooling_device8': no node assigned on NUMA capable HW
[   11.399969] [Firmware Bug]: device: 'cooling_device9': no node assigned on NUMA capable HW
[   11.419789] [Firmware Bug]: device: 'cooling_device10': no node assigned on NUMA capable HW
[   11.440004] [Firmware Bug]: device: 'cooling_device11': no node assigned on NUMA capable HW
[   11.464025] [Firmware Bug]: device: 'cooling_device12': no node assigned on NUMA capable HW
[   11.484837] [Firmware Bug]: device: 'cooling_device13': no node assigned on NUMA capable HW
[   11.505052] [Firmware Bug]: device: 'cooling_device14': no node assigned on NUMA capable HW
[   11.524997] [Firmware Bug]: device: 'cooling_device15': no node assigned on NUMA capable HW
[   11.545174] [Firmware Bug]: device: 'cooling_device16': no node assigned on NUMA capable HW
[   11.565095] [Firmware Bug]: device: 'cooling_device17': no node assigned on NUMA capable HW
[   11.585328] [Firmware Bug]: device: 'cooling_device18': no node assigned on NUMA capable HW
[   11.605273] [Firmware Bug]: device: 'cooling_device19': no node assigned on NUMA capable HW
[   11.625487] [Firmware Bug]: device: 'cooling_device20': no node assigned on NUMA capable HW
[   11.645382] [Firmware Bug]: device: 'cooling_device21': no node assigned on NUMA capable HW
[   11.665511] [Firmware Bug]: device: 'cooling_device22': no node assigned on NUMA capable HW
[   11.685326] [Firmware Bug]: device: 'cooling_device23': no node assigned on NUMA capable HW
[   11.705528] [Firmware Bug]: device: 'cooling_device24': no node assigned on NUMA capable HW
[   11.725422] [Firmware Bug]: device: 'cooling_device25': no node assigned on NUMA capable HW
[   11.745623] [Firmware Bug]: device: 'cooling_device26': no node assigned on NUMA capable HW
[   11.765454] [Firmware Bug]: device: 'cooling_device27': no node assigned on NUMA capable HW
[   11.785643] [Firmware Bug]: device: 'cooling_device28': no node assigned on NUMA capable HW
[   11.805595] [Firmware Bug]: device: 'cooling_device29': no node assigned on NUMA capable HW
[   11.825786] [Firmware Bug]: device: 'cooling_device30': no node assigned on NUMA capable HW
[   11.845675] [Firmware Bug]: device: 'cooling_device31': no node assigned on NUMA capable HW
[   11.865875] [Firmware Bug]: device: 'cooling_device32': no node assigned on NUMA capable HW
[   11.885853] [Firmware Bug]: device: 'cooling_device33': no node assigned on NUMA capable HW
[   11.906039] [Firmware Bug]: device: 'cooling_device34': no node assigned on NUMA capable HW
[   11.925978] [Firmware Bug]: device: 'cooling_device35': no node assigned on NUMA capable HW
[   11.946160] [Firmware Bug]: device: 'cooling_device36': no node assigned on NUMA capable HW
[   11.966030] [Firmware Bug]: device: 'cooling_device37': no node assigned on NUMA capable HW
[   11.986297] [Firmware Bug]: device: 'cooling_device38': no node assigned on NUMA capable HW
[   12.006158] [Firmware Bug]: device: 'cooling_device39': no node assigned on NUMA capable HW
[   12.443956] [Firmware Bug]: device: 'ttm': no node assigned on NUMA capable HW
[   12.490234] [Firmware Bug]: device: 'vtcon1': no node assigned on NUMA capable HW
[   12.585094] [Firmware Bug]: device: 'vtcon0': no node assigned on NUMA capable HW
[   12.889374] [Firmware Bug]: device: 'loop0': no node assigned on NUMA capable HW
[   12.902623] [Firmware Bug]: device: 'loop1': no node assigned on NUMA capable HW
[   12.915193] [Firmware Bug]: device: 'loop2': no node assigned on NUMA capable HW
[   12.928095] [Firmware Bug]: device: 'loop3': no node assigned on NUMA capable HW
[   12.941188] [Firmware Bug]: device: 'loop4': no node assigned on NUMA capable HW
[   12.953799] [Firmware Bug]: device: 'loop5': no node assigned on NUMA capable HW
[   12.966731] [Firmware Bug]: device: 'loop6': no node assigned on NUMA capable HW
[   12.979575] [Firmware Bug]: device: 'loop7': no node assigned on NUMA capable HW
[   13.857948] [Firmware Bug]: device: 'mice': no node assigned on NUMA capable HW
[   13.997228] [Firmware Bug]: device: 'cooling_device40': no node assigned on NUMA capable HW
[   14.006845] [Firmware Bug]: device: 'thermal_zone0': no node assigned on NUMA capable HW
[   14.016649] [Firmware Bug]: device: 'thermal_zone1': no node assigned on NUMA capable HW
[   14.641660] [Firmware Bug]: device: 'timer': no node assigned on NUMA capable HW

The PCI bits indicate my BIOS is shit, I suspect 7f is socket-0 and ff
is socket-1, but I'm not sure how to tie that back up sanely, I _really_
don't know anything about PCI :/

The thermal crud is just that, crud that needs an overhaul. It creates a
'cooling_device' per CPU, but in the process looses all actual
association to the actual CPU number and so we cannot sanely set right
node information, even though thermal does use the devm_ APIs and thus
setting the node number is 'required'. Idem for the 'thermal_zone' ones,
those are the sockets but loose all relation to them in the process.

See how nice it is to be strict? You find bugs everywhere you look. Now
we get to fix them :-)

---
 arch/x86/kernel/cpu/mce/core.c |  1 +
 arch/x86/kernel/cpuid.c        |  1 +
 arch/x86/kernel/msr.c          |  1 +
 drivers/base/bus.c             |  4 +++-
 drivers/base/core.c            | 23 +++++++++++++++++++----
 drivers/base/cpu.c             |  4 +++-
 drivers/base/node.c            |  4 +++-
 drivers/char/mem.c             |  1 +
 drivers/char/misc.c            |  2 ++
 drivers/tty/tty_io.c           |  1 +
 drivers/tty/vt/vc_screen.c     |  3 +++
 drivers/tty/vt/vt.c            |  1 +
 include/linux/device.h         | 10 ++++++++--
 include/linux/numa.h           |  1 +
 kernel/events/core.c           |  1 +
 kernel/time/clockevents.c      |  2 +-
 kernel/time/clocksource.c      |  1 +
 kernel/workqueue.c             |  1 +
 mm/backing-dev.c               |  1 +
 19 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 743370ee4983..ce09413b7c39 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2098,6 +2098,7 @@ static void mce_enable_ce(void *all)
 static struct bus_type mce_subsys = {
 	.name		= "machinecheck",
 	.dev_name	= "machinecheck",
+	.no_devm	= true,
 };
 
 DEFINE_PER_CPU(struct device *, mce_device);
diff --git a/arch/x86/kernel/cpuid.c b/arch/x86/kernel/cpuid.c
index 3492aa36bf09..6d7d2a35e911 100644
--- a/arch/x86/kernel/cpuid.c
+++ b/arch/x86/kernel/cpuid.c
@@ -161,6 +161,7 @@ static int __init cpuid_init(void)
 		goto out_chrdev;
 	}
 	cpuid_class->devnode = cpuid_devnode;
+	cpuid_class->no_devm = true;
 
 	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "x86/cpuid:online",
 				cpuid_device_create, cpuid_device_destroy);
diff --git a/arch/x86/kernel/msr.c b/arch/x86/kernel/msr.c
index 3db2252b958d..e41add671596 100644
--- a/arch/x86/kernel/msr.c
+++ b/arch/x86/kernel/msr.c
@@ -210,6 +210,7 @@ static int __init msr_init(void)
 		goto out_chrdev;
 	}
 	msr_class->devnode = msr_devnode;
+	msr_class->no_devm = true;
 
 	err  = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "x86/msr:online",
 				 msr_device_create, msr_device_destroy);
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index df3cac739813..96ee8c50ab8a 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -1142,7 +1142,9 @@ static int subsys_register(struct bus_type *subsys,
 	dev->groups = groups;
 	dev->release = system_root_device_release;
 
-	err = device_register(dev);
+	device_initialize(dev);
+	set_dev_node(dev, NUMA_INVALID_NODE);
+	err = device_add(dev);
 	if (err < 0)
 		goto err_dev_reg;
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 636058bbf48a..049f3c7dbdcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1670,7 +1670,7 @@ void device_initialize(struct device *dev)
 	spin_lock_init(&dev->devres_lock);
 	INIT_LIST_HEAD(&dev->devres_head);
 	device_pm_init(dev);
-	set_dev_node(dev, -1);
+	set_dev_node(dev, NUMA_NO_NODE);
 #ifdef CONFIG_GENERIC_MSI_IRQ
 	INIT_LIST_HEAD(&dev->msi_list);
 #endif
@@ -2056,9 +2056,24 @@ int device_add(struct device *dev)
 	if (kobj)
 		dev->kobj.parent = kobj;
 
-	/* use parent numa_node */
-	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
-		set_dev_node(dev, dev_to_node(parent));
+#ifdef CONFIG_NUMA
+	/* use parent node */
+	if (dev->numa_node == NUMA_NO_NODE && parent)
+		set_dev_node(dev, parent->numa_node);
+
+	if (dev->numa_node == NUMA_NO_NODE && dev->class && dev->class->no_devm)
+		set_dev_node(dev, NUMA_INVALID_NODE);
+
+	if (dev->numa_node == NUMA_NO_NODE && dev->bus && dev->bus->no_devm)
+		set_dev_node(dev, NUMA_INVALID_NODE);
+
+	/* verify 'real' devices have a node assigned on NUMA capable hardware */
+	if (nr_node_ids > 1 && dev->numa_node == NUMA_NO_NODE) {
+		pr_warn(FW_BUG "device: '%s': no node assigned on NUMA capable HW\n",
+				dev_name(dev));
+		set_dev_node(dev, 0); // assign 'random' valid node
+	}
+#endif
 
 	/* first, register with generic layer. */
 	/* we require the name to be set before, and pass NULL */
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index cc37511de866..6613aed4de17 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -381,7 +381,9 @@ int register_cpu(struct cpu *cpu, int num)
 	cpu->dev.groups = common_cpu_attr_groups;
 	if (cpu->hotpluggable)
 		cpu->dev.groups = hotplugable_cpu_attr_groups;
-	error = device_register(&cpu->dev);
+	device_initialize(&cpu->dev);
+	set_dev_node(&cpu->dev, cpu->node_id);
+	error = device_add(&cpu->dev);
 	if (error) {
 		put_device(&cpu->dev);
 		return error;
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 75b7e6f6535b..153bf21cf7ce 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -616,7 +616,9 @@ static int register_node(struct node *node, int num)
 	node->dev.bus = &node_subsys;
 	node->dev.release = node_device_release;
 	node->dev.groups = node_dev_groups;
-	error = device_register(&node->dev);
+	device_initialize(&node->dev);
+	set_dev_node(&node->dev, num);
+	error = device_add(&node->dev);
 
 	if (error)
 		put_device(&node->dev);
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index b08dc50f9f26..848d704839f0 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -927,6 +927,7 @@ static int __init chr_dev_init(void)
 		return PTR_ERR(mem_class);
 
 	mem_class->devnode = mem_devnode;
+	mem_class->no_devm = true;
 	for (minor = 1; minor < ARRAY_SIZE(devlist); minor++) {
 		if (!devlist[minor].name)
 			continue;
diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index f6a147427029..14ced3adfaad 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -274,6 +274,8 @@ static int __init misc_init(void)
 	if (IS_ERR(misc_class))
 		goto fail_remove;
 
+	misc_class->no_devm = true;
+
 	err = -EIO;
 	if (register_chrdev(MISC_MAJOR, "misc", &misc_fops))
 		goto fail_printk;
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 566728fbaf3c..28e4d531595f 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3419,6 +3419,7 @@ static int __init tty_class_init(void)
 	if (IS_ERR(tty_class))
 		return PTR_ERR(tty_class);
 	tty_class->devnode = tty_devnode;
+	tty_class->no_devm = true;
 	return 0;
 }
 
diff --git a/drivers/tty/vt/vc_screen.c b/drivers/tty/vt/vc_screen.c
index 1f042346e722..b8fa9e6c0b71 100644
--- a/drivers/tty/vt/vc_screen.c
+++ b/drivers/tty/vt/vc_screen.c
@@ -735,6 +735,9 @@ int __init vcs_init(void)
 		panic("unable to get major %d for vcs device", VCS_MAJOR);
 	vc_class = class_create(THIS_MODULE, "vc");
 
+	if (vc_class)
+		vc_class->no_devm = true;
+
 	device_create(vc_class, NULL, MKDEV(VCS_MAJOR, 0), NULL, "vcs");
 	device_create(vc_class, NULL, MKDEV(VCS_MAJOR, 64), NULL, "vcsu");
 	device_create(vc_class, NULL, MKDEV(VCS_MAJOR, 128), NULL, "vcsa");
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 34aa39d1aed9..15add0f1b0d0 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4138,6 +4138,7 @@ static int __init vtconsole_class_init(void)
 			PTR_ERR(vtconsole_class));
 		vtconsole_class = NULL;
 	}
+	vtconsole_class->no_devm = true;
 
 	/* Add system drivers to sysfs */
 	for (i = 0; i < MAX_NR_CON_DRIVER; i++) {
diff --git a/include/linux/device.h b/include/linux/device.h
index 6717adee33f0..6414788e642e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -144,6 +144,7 @@ struct bus_type {
 	struct lock_class_key lock_key;
 
 	bool need_parent_lock;
+	bool no_devm;
 };
 
 extern int __must_check bus_register(struct bus_type *bus);
@@ -428,6 +429,8 @@ struct class {
 	const struct dev_pm_ops *pm;
 
 	struct subsys_private *p;
+
+	bool no_devm;
 };
 
 struct class_dev_iter {
@@ -1109,7 +1112,10 @@ int dev_set_name(struct device *dev, const char *name, ...);
 #ifdef CONFIG_NUMA
 static inline int dev_to_node(struct device *dev)
 {
-	return dev->numa_node;
+	int node = dev->numa_node;
+	if (WARN_ON(node == NUMA_INVALID_NODE))
+		node = 0; // 'random' valid node
+	return node;
 }
 static inline void set_dev_node(struct device *dev, int node)
 {
@@ -1118,7 +1124,7 @@ static inline void set_dev_node(struct device *dev, int node)
 #else
 static inline int dev_to_node(struct device *dev)
 {
-	return NUMA_NO_NODE;
+	return 0;
 }
 static inline void set_dev_node(struct device *dev, int node)
 {
diff --git a/include/linux/numa.h b/include/linux/numa.h
index 110b0e5d0fb0..7d8597f1d73a 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -12,5 +12,6 @@
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
 
 #define	NUMA_NO_NODE	(-1)
+#define NUMA_INVALID_NODE (-2)
 
 #endif /* _LINUX_NUMA_H */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index caae4b7743b4..3bc081bfbb3f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9865,6 +9865,7 @@ static int pmu_bus_running;
 static struct bus_type pmu_bus = {
 	.name		= "event_source",
 	.dev_groups	= pmu_dev_groups,
+	.no_devm	= true,
 };
 
 static void pmu_dev_release(struct device *dev)
diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index f5490222e134..27ce96638b96 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -663,6 +663,7 @@ void tick_cleanup_dead_cpu(int cpu)
 static struct bus_type clockevents_subsys = {
 	.name		= "clockevents",
 	.dev_name       = "clockevent",
+	.no_devm	= true,
 };
 
 static DEFINE_PER_CPU(struct device, tick_percpu_dev);
@@ -732,7 +733,6 @@ static struct tick_device *tick_get_tick_dev(struct device *dev)
 static __init int tick_broadcast_init_sysfs(void)
 {
 	int err = device_register(&tick_bc_dev);
-
 	if (!err)
 		err = device_create_file(&tick_bc_dev, &dev_attr_current_device);
 	return err;
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index fff5f64981c6..a6809106750d 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -1171,6 +1171,7 @@ ATTRIBUTE_GROUPS(clocksource);
 static struct bus_type clocksource_subsys = {
 	.name = "clocksource",
 	.dev_name = "clocksource",
+	.no_devm = true,
 };
 
 static struct device device_clocksource = {
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 601d61150b65..bd1e48239dfd 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5513,6 +5513,7 @@ static struct device_attribute wq_sysfs_unbound_attrs[] = {
 static struct bus_type wq_subsys = {
 	.name				= "workqueue",
 	.dev_groups			= wq_sysfs_groups,
+	.no_devm			= true,
 };
 
 static ssize_t wq_unbound_cpumask_show(struct device *dev,
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index e8e89158adec..2f4473c74c5c 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -224,6 +224,7 @@ static __init int bdi_class_init(void)
 		return PTR_ERR(bdi_class);
 
 	bdi_class->dev_groups = bdi_dev_groups;
+	bdi_class->no_devm = true;
 	bdi_debug_init();
 
 	return 0;

