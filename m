Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FED12540A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 22:01:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dS9l2Pc9zDqlD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 08:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dS6r00GdzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 07:59:14 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5AF62AD4A;
 Wed, 18 Dec 2019 20:59:08 +0000 (UTC)
Date: Wed, 18 Dec 2019 21:59:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v15 06/23] selftests/vm/pkeys: Typecast the pkey register
Message-ID: <20191218205905.GG4113@kitsune.suse.cz>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
 <719ec65756a64cc03e8464a9c6da51c4519d2389.1576645161.git.sandipan@linux.ibm.com>
 <5b6c3f8a-9d2f-2534-c072-89f130ce110f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b6c3f8a-9d2f-2534-c072-89f130ce110f@intel.com>
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, aneesh.kumar@linux.ibm.com,
 x86@kernel.org, linuxram@us.ibm.com, shuahkh@osg.samsung.com,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com,
 Sandipan Das <sandipan@linux.ibm.com>, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 12:46:50PM -0800, Dave Hansen wrote:
> On 12/17/19 11:51 PM, Sandipan Das wrote:
> >  	write_pkey_reg(pkey_reg);
> > -	dprintf4("pkey_reg now: %08x\n", read_pkey_reg());
> > +	dprintf4("pkey_reg now: "PKEY_REG_FMT"\n", read_pkey_reg());
> >  }
> >  
> >  #define ARRAY_SIZE(x) (sizeof(x) / sizeof(*(x)))
> > diff --git a/tools/testing/selftests/vm/pkey-x86.h b/tools/testing/selftests/vm/pkey-x86.h
> > index 2f04ade8ca9c..5f40901219d3 100644
> > --- a/tools/testing/selftests/vm/pkey-x86.h
> > +++ b/tools/testing/selftests/vm/pkey-x86.h
> > @@ -46,6 +46,8 @@
> >  #define HPAGE_SIZE		(1UL<<21)
> >  #define PAGE_SIZE		4096
> >  #define MB			(1<<20)
> > +#define pkey_reg_t		u32
> > +#define PKEY_REG_FMT		"%016x"
> 
> How big is the ppc one?
u64
> 
> I'd really just rather do %016lx *everywhere* than sprinkle the
> PKEY_REG_FMTs around.

Does lx work with u32 without warnings?

It's likely the size difference that requires a format specifier definition.

> 
> BTW, why are you doing a %016lx for a u32?

It's "%016x" without 'l' for x86 and with 'l' for ppc64.

Thanks

Michal
