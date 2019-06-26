Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB5456B60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 15:58:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Yl4705ykzDqKS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 23:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Yl033YxBzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 23:54:58 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2ABDAE3F;
 Wed, 26 Jun 2019 13:54:52 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:54:50 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Barret Rhoden <brho@google.com>
Subject: Re: [PATCH 1/2] x86, numa: always initialize all possible nodes
Message-ID: <20190626135450.GW17798@dhcp22.suse.cz>
References: <20190212095343.23315-1-mhocko@kernel.org>
 <20190212095343.23315-2-mhocko@kernel.org>
 <34f96661-41c2-27cc-422d-5a7aab526f87@google.com>
 <20190502130031.GC29835@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502130031.GC29835@dhcp22.suse.cz>
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
Cc: Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-mm@kvack.org,
 Ingo Molnar <mingo@elte.hu>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 02-05-19 09:00:31, Michal Hocko wrote:
> On Wed 01-05-19 15:12:32, Barret Rhoden wrote:
> [...]
> > A more elegant solution may be to avoid registering with sysfs during early
> > boot, or something else entirely.  But I figured I'd ask for help at this
> > point.  =)
> 
> Thanks for the report and an excellent analysis! This is really helpful.
> I will think about this some more but I am traveling this week. It seems
> really awkward to register a sysfs file for an empty range. That looks
> like a bug to me.

I am sorry, but I didn't get to this for a long time and I am still
busy. The patch has been dropped from the mm tree (thus linux-next). I
hope I can revisit this or somebody else will take over and finish this
work. This is much more trickier than I anticipated unfortunately.

-- 
Michal Hocko
SUSE Labs
