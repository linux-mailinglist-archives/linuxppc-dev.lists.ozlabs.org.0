Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE69A72C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 07:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F99w6BJzzDrfw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 15:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F95r3DCVzDrff
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 15:32:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="J/JhSKyJ"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46F95q6lYyz9s3Z; Fri, 23 Aug 2019 15:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1566538367; bh=z02FCq36ZOlybuIQo9saHjlkCOE1r+GbTnZ2u8ZYozQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/JhSKyJna3dO+hzVwvKqr555OfMsYkSc6rEU4HDI6t7UXTZHTXFw0kUqNtRyy1fT
 XZyG/guq1JZXAD1JYZyREjzSKwT6GNg2EdxDMBXY+ve7kgOG8szGrIaMMU/8EKCnyd
 aqmdM2IfW0NRJlzhmm0iNJfc2uKXKdhv4xxiOzyxO5RBad4beOWcisAo4QRjQvL3uZ
 L08pjXagLF/YR+8V5WEbqt0bH/8AvagOKgWfNO33k8vwEm3ehMt6BldhXCpwlAKll+
 Swt7Wc9SWo0muhF2IbJRhtyIOpv1eFZ2DG4ba8glK3yeGGJCS6v7LuIh+B0hvTl8zy
 vgO9sc3zYRUcA==
Date: Fri, 23 Aug 2019 14:17:47 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 0/7] KVMPPC driver to manage secure guest pages
Message-ID: <20190823041747.ctquda5uwvy2eiqz@oak.ozlabs.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822102620.21897-1-bharata@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 03:56:13PM +0530, Bharata B Rao wrote:
> Hi,
> 
> A pseries guest can be run as a secure guest on Ultravisor-enabled
> POWER platforms. On such platforms, this driver will be used to manage
> the movement of guest pages between the normal memory managed by
> hypervisor(HV) and secure memory managed by Ultravisor(UV).
> 
> Private ZONE_DEVICE memory equal to the amount of secure memory
> available in the platform for running secure guests is created.
> Whenever a page belonging to the guest becomes secure, a page from
> this private device memory is used to represent and track that secure
> page on the HV side. The movement of pages between normal and secure
> memory is done via migrate_vma_pages(). The reverse movement is driven
> via pagemap_ops.migrate_to_ram().
> 
> The page-in or page-out requests from UV will come to HV as hcalls and
> HV will call back into UV via uvcalls to satisfy these page requests.
> 
> These patches are against hmm.git
> (https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm)
> 
> plus
> 
> Claudio Carvalho's base ultravisor enablement patchset v6
> (https://lore.kernel.org/linuxppc-dev/20190822034838.27876-1-cclaudio@linux.ibm.com/T/#t)

How are you thinking these patches will go upstream?  Are you going to
send them via the hmm tree?

I assume you need Claudio's patchset as a prerequisite for your series
to compile, which means the hmm maintainers would need to pull in a
topic branch from Michael Ellerman's powerpc tree, or something like
that.

Paul.
