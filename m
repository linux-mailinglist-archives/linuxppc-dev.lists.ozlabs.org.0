Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACC2675BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 00:14:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp96P74QKzDqwv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 08:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp94b101yzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 08:13:14 +1000 (AEST)
IronPort-SDR: y/rMe4GaTfwpDf+7lSnQpRQ/WriXBxKT7z87QHM6Tt6EZ4RvJxFERSVFd4VaK2BpIwGw4HIHhM
 r1CUFhMqYxRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="138878068"
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; d="scan'208";a="138878068"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 15:13:09 -0700
IronPort-SDR: eTBig4hSfL6lnTJoihIlCligSUTrY/gvwuRRv5l5i1orlyCrKapzQqaoAgppDDKttlAwqw58YC
 lpb7mf49z4Kw==
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; d="scan'208";a="481488523"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 15:13:09 -0700
Date: Fri, 11 Sep 2020 15:13:08 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
Message-ID: <20200911221308.GP1930795@iweiny-DESK2.sc.intel.com>
References: <20200910092212.107674-1-vaibhav@linux.ibm.com>
 <20200910155552.GN1930795@iweiny-DESK2.sc.intel.com>
 <878sdgqdrd.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sdgqdrd.fsf@vajain21.in.ibm.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 12, 2020 at 01:36:46AM +0530, Vaibhav Jain wrote:
> Thanks for reviewing this patch Ira,
> 
> 
> Ira Weiny <ira.weiny@intel.com> writes:
> 
> > On Thu, Sep 10, 2020 at 02:52:12PM +0530, Vaibhav Jain wrote:
> >> A warning is reported by the kernel in case perf_stats_show() returns
> >> an error code. The warning is of the form below:
> >> 
> >>  papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
> >>  	  Failed to query performance stats, Err:-10
> >>  dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
> >>  fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count
> >> 
> >> On investigation it looks like that the compiler is silently truncating the
> >> return value of drc_pmem_query_stats() from 'long' to 'int', since the
> >> variable used to store the return code 'rc' is an 'int'. This
> >> truncated value is then returned back as a 'ssize_t' back from
> >> perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
> >> unsigned number and triggers this warning..
> >> 
> >> To fix this we update the type of variable 'rc' from 'int' to
> >> 'ssize_t' that prevents the compiler from truncating the return value
> >> of drc_pmem_query_stats() and returning correct signed value back from
> >> perf_stats_show().
> >> 
> >> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
> >>        stats from PHYP')
> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index a88a707a608aa..9f00b61676ab9 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -785,7 +785,8 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> >>  static ssize_t perf_stats_show(struct device *dev,
> >>  			       struct device_attribute *attr, char *buf)
> >>  {
> >> -	int index, rc;
> >> +	int index;
> >> +	ssize_t rc;
> >
> > I'm not sure this is really fixing everything here.
> 
> The issue is with the statement in perf_stats_show():
> 
> 'return rc ? rc : seq_buf_used(&s);'
> 
> The function seq_buf_used() returns an 'unsigned int' and with 'rc'
> typed as 'int', forces a promotion of the expression to 'unsigned int'
> which causes a loss of signedness of 'rc' and compiler silently
> assigns this unsigned value to the function return typed as 'signed
> long'.
> 
> Making 'rc', a 'signed long' forces a promotion of the expresion to
> 'signed long' which preserves the signedness of 'rc' and will also be
> compatible with the function return type.

Ok, ok, I read this all wrong.

FWIW I would also cast seq_buf_used() to ssize_t to show you know what you are
doing there.

> 
> >
> > drc_pmem_query_stats() can return negative errno's.  Why are those not checked
> > somewhere in perf_stats_show()?
> >
> For the specific invocation 'drc_pmem_query_stats(p, stats, 0)' we only
> expect return value 'rc <=0' with '0' indicating a successful fetch of
> nvdimm performance stats from hypervisor. Hence there are no explicit
> checks for negative error codes in the functions as all return values
> !=0 indicate an error.
> 
> 
> > It seems like all this fix is handling is a > 0 return value: 'ret[0]' from
> > line 289 in papr_scm.c...  Or something?
> No, in case the arg 'num_stats' is '0' and 'buff_stats != NULL' the
> variable 'size' is assigned a non-zero value hence that specific branch
> you mentioned  is never taken. Instead in case of success
> drc_pmem_query_stats() return '0' and in case of an error a negative
> error code is returned.
> 
> >
> > Worse yet drc_pmem_query_stats() is returning ssize_t which is a signed value.
> > Therefore, it should not be returning -errno.  I'm surprised the static
> > checkers did not catch that.
> Didnt quite get the assertion here. The function is marked to return
> 'ssize_t' because we can return both +ve for success and -ve values to
> indicate errors.

Sorry I was reading this as size_t and meant to say unsigned...  I was looking
at this too quickly.

> 
> >
> > I believe I caught similar errors with a patch series before which did not pay
> > attention to variable types.
> >
> > Please audit this code for these types of errors and ensure you are really
> > doing the correct thing when using the sysfs interface.  I'm pretty sure bad
> > things will eventually happen (if they are not already) if you return some
> > really big number to the sysfs core from *_show().
> I think this problem is different compared to what you had previously pointed
> to. The values returned from drc_pmem_query_stats() can be stored in an
> 'int' variable too, however it was the silent promotion of a signed type
> to unsigned type was what caused this specific issue.

Ok this makes more sense now.  Sorry about not looking more carefully.

But I still think matching up the return of seq_buf_used() is worth it.  I
don't particularly like depending on 'automatic' promotions which make
reviewing code harder like this.

And sorry if my email seemed harsh I did not mean it to be.  I just like when
types are more explicit because I feel like it can avoid issues like this.
(Specifically my confusion over the types...)

:-D

Thanks,
Ira

