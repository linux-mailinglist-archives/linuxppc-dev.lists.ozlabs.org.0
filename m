Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9F64C23E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 03:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWzlj5vmxz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 13:27:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C2PEi8my;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cJyJq1Ff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pauld@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C2PEi8my;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cJyJq1Ff;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWzkj2k6rz3bTF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 13:26:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670984775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HABs8lboAqWrIj3Kb+A7J5b/TEGYff3lt374RRDB9lk=;
	b=C2PEi8my7a4B6mSJHHSVBDEkQRfwGpOAglUlw6dNY5VLGYRjQHWD9ZPTAGTKIcuV763Ye+
	+vaSsRGD/voTnmFyVrLTYdzbaUOzwAfqWmcqo14IlIvLfPbY/vQnT1xs/K163pL9RFYex8
	JwH2Gp5uUO8GHVJ0FHEPeMhpfL/cp80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670984776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HABs8lboAqWrIj3Kb+A7J5b/TEGYff3lt374RRDB9lk=;
	b=cJyJq1FfUbhMBvFZjEFuUG/ySqfFci+1+G0vL30yBfDC1sTc4oaxp9jvUvhloC3b9wLlJZ
	twbnsbkJdv3khYiwgANPcUMtaWfb4r0XuAdEntnXPfPqjhEbD19rgpJ5heoxTtEmw40D3a
	Dj/URIyUBJGvs9oHIqY1yNa/yE1qocs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-0xj0ZpXsPUW5xZiSlAF7AA-1; Tue, 13 Dec 2022 21:26:11 -0500
X-MC-Unique: 0xj0ZpXsPUW5xZiSlAF7AA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25C7101A528;
	Wed, 14 Dec 2022 02:26:10 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.22.17.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80021492C14;
	Wed, 14 Dec 2022 02:26:06 +0000 (UTC)
Date: Tue, 13 Dec 2022 21:26:02 -0500
From: Phil Auld <pauld@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y5k0OmLAWD2wk7yL@lorien.usersys.redhat.com>
References: <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
 <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
 <Y2oozs/YgqqRV5hq@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y2pKh3H0Ukvmfuco@kroah.com>
 <Y5d+ZqdxeJD2eIHL@lorien.usersys.redhat.com>
 <Y5gaerSL8pXZcIjR@kroah.com>
 <Y5h8sqHD9/RWNeYS@lorien.usersys.redhat.com>
 <878rjakh22.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rjakh22.fsf@mpe.ellerman.id.au>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 14, 2022 at 10:41:25AM +1100 Michael Ellerman wrote:
> Phil Auld <pauld@redhat.com> writes:
> > On Tue, Dec 13, 2022 at 07:23:54AM +0100 Greg Kroah-Hartman wrote:
> >> On Mon, Dec 12, 2022 at 02:17:58PM -0500, Phil Auld wrote:
> >> > Hi,
> >> > 
> >> > On Tue, Nov 08, 2022 at 01:24:39PM +0100 Greg Kroah-Hartman wrote:
> >> > > On Tue, Nov 08, 2022 at 03:30:46PM +0530, Vishal Chourasia wrote:
> >> > > > 
> >> > > > Thanks Greg & Peter for your direction. 
> >> > > > 
> >> > > > While we pursue the idea of having debugfs based on kernfs, we thought about
> >> > > > having a boot time parameter which would disable creating and updating of the
> >> > > > sched_domain debugfs files and this would also be useful even when the kernfs
> >> > > > solution kicks in, as users who may not care about these debugfs files would
> >> > > > benefit from a faster CPU hotplug operation.
> >> > > 
> >> > > Ick, no, you would be adding a new user/kernel api that you will be
> >> > > required to support for the next 20+ years.  Just to get over a
> >> > > short-term issue before you solve the problem properly.
> >> > 
> >> > I'm not convinced moving these files from debugfs to kernfs is the right
> >> > fix.  That will take it from ~50 back to ~20 _minutes_ on these systems.
> >> > I don't think either of those numbers is reasonable.
> >> > 
> >> > The issue as I see it is the full rebuild for every change with no way to
> >> > batch the changes. How about something like the below?
> >> > 
> >> > This puts the domains/* files under the sched_verbose flag. About the only
> >> > thing under that flag now are the detailed topology discovery printks anyway
> >> > so this fits together nicely.
> >> > 
> >> > This way the files would be off by default (assuming you don't boot with
> >> > sched_verbose) and can be created at runtime by enabling verbose. Multiple
> >> > changes could also be batched by disabling/makeing changes/re-enabling.
> >> > 
> >> > It does not create a new API, uses one that is already there.
> >> 
> >> The idea seems good, the implementation might need a bit of work :)
> >
> > More than the one comment below? Let me know.
> >
> >> 
> >> > > If you really do not want these debugfs files, just disable debugfs from
> >> > > your system.  That should be a better short-term solution, right?
> >> > 
> >> > We do find these files useful at times for debugging issue and looking
> >> > at what's going on on the system.
> >> > 
> >> > > 
> >> > > Or better yet, disable SCHED_DEBUG, why can't you do that?
> >> > 
> >> > Same with this... useful information with (modulo issues like this)
> >> > small cost. There are also tuning knobs that are only available
> >> > with SCHED_DEBUG. 
> >> > 
> >> > 
> >> > Cheers,
> >> > Phil
> >> > 
> >> > ---------------
> >> > 
> >> > sched/debug: Put sched/domains files under verbose flag
> >> > 
> >> > The debug files under sched/domains can take a long time to regenerate,
> >> > especially when updates are done one at a time. Move these files under
> >> > the verbose debug flag. Allow changes to verbose to trigger generation
> >> > of the files. This lets a user batch the updates but still have the
> >> > information available.  The detailed topology printk messages are also
> >> > under verbose.
> >> > 
> >> > Signed-off-by: Phil Auld <pauld@redhat.com>
> >> > ---
> >> >  kernel/sched/debug.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
> >> >  1 file changed, 66 insertions(+), 2 deletions(-)
> >> > 
> >> > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> >> > index 1637b65ba07a..2eb51ee3ccab 100644
> >> > --- a/kernel/sched/debug.c
> >> > +++ b/kernel/sched/debug.c
> >> > @@ -280,6 +280,31 @@ static const struct file_operations sched_dynamic_fops = {
> >> >  
> >> >  __read_mostly bool sched_debug_verbose;
> >> >  
> >> > +static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
> >> > +				   size_t cnt, loff_t *ppos);
> >> > +
> >> > +static int sched_verbose_show(struct seq_file *m, void *v)
> >> > +{
> >> > +	if (sched_debug_verbose)
> >> > +		seq_puts(m,"Y\n");
> >> > +	else
> >> > +		seq_puts(m,"N\n");
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static int sched_verbose_open(struct inode *inode, struct file *filp)
> >> > +{
> >> > +	return single_open(filp, sched_verbose_show, NULL);
> >> > +}
> >> > +
> >> > +static const struct file_operations sched_verbose_fops = {
> >> > +	.open		= sched_verbose_open,
> >> > +	.write		= sched_verbose_write,
> >> > +	.read		= seq_read,
> >> > +	.llseek		= seq_lseek,
> >> > +	.release	= seq_release,
> >> > +};
> >> > +
> >> >  static const struct seq_operations sched_debug_sops;
> >> >  
> >> >  static int sched_debug_open(struct inode *inode, struct file *filp)
> >> > @@ -303,7 +328,7 @@ static __init int sched_init_debug(void)
> >> >  	debugfs_sched = debugfs_create_dir("sched", NULL);
> >> >  
> >> >  	debugfs_create_file("features", 0644, debugfs_sched, NULL, &sched_feat_fops);
> >> > -	debugfs_create_bool("verbose", 0644, debugfs_sched, &sched_debug_verbose);
> >> > +	debugfs_create_file("verbose", 0644, debugfs_sched, NULL, &sched_verbose_fops);
> >> >  #ifdef CONFIG_PREEMPT_DYNAMIC
> >> >  	debugfs_create_file("preempt", 0644, debugfs_sched, NULL, &sched_dynamic_fops);
> >> >  #endif
> >> > @@ -402,15 +427,23 @@ void update_sched_domain_debugfs(void)
> >> >  	if (!debugfs_sched)
> >> >  		return;
> >> >  
> >> > +	if (!sched_debug_verbose)
> >> > +		return;
> >> > +
> >> >  	if (!cpumask_available(sd_sysctl_cpus)) {
> >> >  		if (!alloc_cpumask_var(&sd_sysctl_cpus, GFP_KERNEL))
> >> >  			return;
> >> >  		cpumask_copy(sd_sysctl_cpus, cpu_possible_mask);
> >> >  	}
> >> >  
> >> > -	if (!sd_dentry)
> >> > +	if (!sd_dentry) {
> >> >  		sd_dentry = debugfs_create_dir("domains", debugfs_sched);
> >> >  
> >> > +		/* rebuild sd_sysclt_cpus if empty since it gets cleared below */
> >> > +		if (cpumask_first(sd_sysctl_cpus) >=  nr_cpu_ids)
> >> > +			cpumask_copy(sd_sysctl_cpus, cpu_online_mask);
> >> > +	}
> >> > +
> >> >  	for_each_cpu(cpu, sd_sysctl_cpus) {
> >> >  		struct sched_domain *sd;
> >> >  		struct dentry *d_cpu;
> >> > @@ -443,6 +476,37 @@ void dirty_sched_domain_sysctl(int cpu)
> >> >  
> >> >  #endif /* CONFIG_SMP */
> >> >  
> >> > +static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
> >> > +				   size_t cnt, loff_t *ppos)
> >> > +{
> >> > +	struct dentry *dentry = filp->f_path.dentry;
> >> > +	bool orig = sched_debug_verbose;
> >> > +	bool bv;
> >> > +	int r;
> >> > +
> >> > +	r = kstrtobool_from_user(ubuf, cnt, &bv);
> >> > +	if (!r) {
> >> > +		mutex_lock(&sched_domains_mutex);
> >> > +		r = debugfs_file_get(dentry);
> >> > +		if (unlikely(r))
> >> > +			return r;
> >> > +		sched_debug_verbose = bv;
> >> > +		debugfs_file_put(dentry);
> >> 
> >> Why the get/put of the debugfs dentry? for just this single value?
> >
> > That's what debugfs_file_write_bool() does, which is where I got that since
> > that's really what this is doing. I couldn't see a good way to make this
> > just call that.
> 
> I think you can do it like below? Only lightly tested :)
>

That simplifies things.  Thanks!

I'm testing a new version now but will switch to this method and see what
happens.


Cheers,
Phil


> cheers
> 
> 
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 1637b65ba07a..bc96380cf336 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -280,6 +279,42 @@ static const struct file_operations sched_dynamic_fops = {
>  
>  __read_mostly bool sched_debug_verbose;
>  
> +#ifdef CONFIG_SMP
> +static struct dentry		*sd_dentry;
> +
> +static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
> +				   size_t cnt, loff_t *ppos)
> +{
> +	ssize_t result;
> +	bool orig;
> +
> +	mutex_lock(&sched_domains_mutex);
> +
> +	orig = sched_debug_verbose;
> +	result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
> +
> +	if (sched_debug_verbose && !orig)
> +		update_sched_domain_debugfs();
> +	else if (!sched_debug_verbose && orig) {
> +		debugfs_remove(sd_dentry);
> +		sd_dentry = NULL;
> +	}
> +
> +	mutex_unlock(&sched_domains_mutex);
> +
> +	return result;
> +}
> +#else
> +#define sched_verbose_write debugfs_write_file_bool
> +#endif
> +
> +static const struct file_operations sched_verbose_fops = {
> +	.read =		debugfs_read_file_bool,
> +	.write =	sched_verbose_write,
> +	.open =		simple_open,
> +	.llseek =	default_llseek,
> +};
> +
>  static const struct seq_operations sched_debug_sops;
>  
>  static int sched_debug_open(struct inode *inode, struct file *filp)
> @@ -303,7 +338,7 @@ static __init int sched_init_debug(void)
>  	debugfs_sched = debugfs_create_dir("sched", NULL);
>  
>  	debugfs_create_file("features", 0644, debugfs_sched, NULL, &sched_feat_fops);
> -	debugfs_create_bool("verbose", 0644, debugfs_sched, &sched_debug_verbose);
> +	debugfs_create_file_unsafe("verbose", 0644, debugfs_sched, &sched_debug_verbose, &sched_verbose_fops);
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  	debugfs_create_file("preempt", 0644, debugfs_sched, NULL, &sched_dynamic_fops);
>  #endif
> @@ -345,7 +380,6 @@ late_initcall(sched_init_debug);
>  #ifdef CONFIG_SMP
>  
>  static cpumask_var_t		sd_sysctl_cpus;
> -static struct dentry		*sd_dentry;
>  
>  static int sd_flags_show(struct seq_file *m, void *v)
>  {
> @@ -402,15 +436,23 @@ void update_sched_domain_debugfs(void)
>  	if (!debugfs_sched)
>  		return;
>  
> +	if (!sched_debug_verbose)
> +		return;
> +
>  	if (!cpumask_available(sd_sysctl_cpus)) {
>  		if (!alloc_cpumask_var(&sd_sysctl_cpus, GFP_KERNEL))
>  			return;
>  		cpumask_copy(sd_sysctl_cpus, cpu_possible_mask);
>  	}
>  
> -	if (!sd_dentry)
> +	if (!sd_dentry) {
>  		sd_dentry = debugfs_create_dir("domains", debugfs_sched);
>  
> +		/* rebuild sd_sysclt_cpus if empty since it gets cleared below */
> +		if (cpumask_first(sd_sysctl_cpus) >=  nr_cpu_ids)
> +			cpumask_copy(sd_sysctl_cpus, cpu_online_mask);
> +	}
> +
>  	for_each_cpu(cpu, sd_sysctl_cpus) {
>  		struct sched_domain *sd;
>  		struct dentry *d_cpu;
> 

-- 

