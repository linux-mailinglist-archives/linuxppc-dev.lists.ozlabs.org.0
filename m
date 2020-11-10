Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF372AD1C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:50:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVhQT3NWszDqVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=iuo8f+7v; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=y7osrUd/; 
 dkim-atps=neutral
X-Greylist: delayed 27261 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Nov 2020 19:48:36 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVhNN0CQYzDqL5;
 Tue, 10 Nov 2020 19:48:35 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604998111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lFM+Dy1hrzRRrrrA3qnbGkxEtyVqIh0g4peYrriLeU=;
 b=iuo8f+7vFglLggVRQElkiZ2WEkqCMbTG8xoMGtVyBk3DBfZOlzK9bn4iYE9n5TJlXEeyiw
 mK2AsUoeE727uJ+eyVgbEeyt2qz1CsngbkfMTC30zg6BSGbxrFxVJV/nTlcmtj9NHSMsJn
 sU38ljGJ30NJ8ooIZ53QTax6dO6NfnLLpRxklxBphTMVejdacYZZqkmCK8e4gkxhfN2Hq9
 zuGNw+h8VUH3NFZO14JlYgbkNPH833xVYFQ2lmqEAC35a4/baTqfi6uG7ey36+HQyygrEi
 Jy4I41umlX4stejJrRBLu7awPrfWhbLcelHNMzqQQSqRZrKTpO34TDntXU+02A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604998111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lFM+Dy1hrzRRrrrA3qnbGkxEtyVqIh0g4peYrriLeU=;
 b=y7osrUd/437dzM5/Hc5G9cQ/HuZ2jh7vgX8EDHSswmJuPLkHyLG6iEX8rrCl2sg3XohELe
 1aQhUu8PTNjq+DAw==
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC PKS/PMEM 05/58] kmap: Introduce k[un]map_thread
In-Reply-To: <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-6-ira.weiny@intel.com>
 <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
 <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
Date: Tue, 10 Nov 2020 09:48:31 +0100
Message-ID: <87eel1iom8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 09 2020 at 20:59, Ira Weiny wrote:
> On Tue, Nov 10, 2020 at 02:13:56AM +0100, Thomas Gleixner wrote:
> Also, we can convert the new memcpy_*_page() calls to kmap_local() as well.
> [For now my patch just uses kmap_atomic().]
>
> I've not looked at all of the patches in your latest version.  Have you
> included converting any of the kmap() call sites?  I thought you were more
> focused on converting the kmap_atomic() to kmap_local()?

I did not touch any of those yet, but it's a logical consequence to
convert all kmap() instances which are _not_ creating a global mapping
over to it.

Thanks,

        tglx

