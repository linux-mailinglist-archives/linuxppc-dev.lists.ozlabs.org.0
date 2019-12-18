Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CA125514
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 22:48:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dTCh6H65zDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 08:48:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dT8N0nZ7zDqBl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 08:45:36 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96540AD5D;
 Wed, 18 Dec 2019 21:45:32 +0000 (UTC)
Date: Wed, 18 Dec 2019 22:45:31 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v15 06/23] selftests/vm/pkeys: Typecast the pkey register
Message-ID: <20191218214531.GI4113@kitsune.suse.cz>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
 <719ec65756a64cc03e8464a9c6da51c4519d2389.1576645161.git.sandipan@linux.ibm.com>
 <5b6c3f8a-9d2f-2534-c072-89f130ce110f@intel.com>
 <20191218205905.GG4113@kitsune.suse.cz>
 <15c3b6cc-d8da-9a32-da6a-4c3990f48994@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15c3b6cc-d8da-9a32-da6a-4c3990f48994@intel.com>
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

On Wed, Dec 18, 2019 at 01:01:46PM -0800, Dave Hansen wrote:
> On 12/18/19 12:59 PM, Michal Suchánek wrote:
> >> I'd really just rather do %016lx *everywhere* than sprinkle the
> >> PKEY_REG_FMTs around.
> > Does lx work with u32 without warnings?
> 
> Either way, I'd be happy to just make the x86 one u64 to make the whole
> thing look more sane,

So long as it still works with u64 on x86 it should be pretty
future-proof.  Does not look like we are getting 128bit registers for
anything but math units any time soon.

Thanks

Michal
