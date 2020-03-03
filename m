Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500C17735B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 11:02:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wsxy4M9fzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 21:02:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RvLaQssS; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wssr10c0zDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:58:56 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C103020866;
 Tue,  3 Mar 2020 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583229533;
 bh=4mY+eBzqEAqUVgHJBB+37VWPwTk5qHToh5K0kzSRiGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvLaQssSdeUj4EIJz4bsPbTB5s6RWxPx2KmQIq3H4ZfSpkCu4UU8sXwU5FecLG1jM
 LwRTmFo5dE5dQuvB90IyP711StWZRPZbaOQrDHv1KcqLYhQ8MVM7ycOqXZgJvmQ+2T
 if72tEA5TIdvg5XYBmUAu5z0dyfPhVTEm/UajgPk=
Date: Tue, 3 Mar 2020 10:58:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/6] powerpc: kvm: no need to check return value of
 debugfs_create functions
Message-ID: <20200303095849.GA1399072@kroah.com>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
 <20200209105901.1620958-2-gregkh@linuxfoundation.org>
 <87imjlswxc.fsf@mpe.ellerman.id.au>
 <20200303085039.GA1323622@kroah.com>
 <87d09tsrf0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d09tsrf0.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 03, 2020 at 08:45:23PM +1100, Michael Ellerman wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > On Tue, Mar 03, 2020 at 06:46:23PM +1100, Michael Ellerman wrote:
> >> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> > When calling debugfs functions, there is no need to ever check the
> >> > return value.  The function can work or not, but the code logic should
> >> > never do something different based on this.
> >> 
> >> Except it does need to do something different, if the file was created
> >> it needs to be removed in the remove path.
> >> 
> >> > diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
> >> > index bfe4f106cffc..8e4791c6f2af 100644
> >> > --- a/arch/powerpc/kvm/timing.c
> >> > +++ b/arch/powerpc/kvm/timing.c
> >> > @@ -207,19 +207,12 @@ static const struct file_operations kvmppc_exit_timing_fops = {
> >> >  void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id)
> >> >  {
> >> >  	static char dbg_fname[50];
> >> > -	struct dentry *debugfs_file;
> >> >  
> >> >  	snprintf(dbg_fname, sizeof(dbg_fname), "vm%u_vcpu%u_timing",
> >> >  		 current->pid, id);
> >> > -	debugfs_file = debugfs_create_file(dbg_fname, 0666,
> >> > -					kvm_debugfs_dir, vcpu,
> >> > -					&kvmppc_exit_timing_fops);
> >> > -
> >> > -	if (!debugfs_file) {
> >> > -		printk(KERN_ERR"%s: error creating debugfs file %s\n",
> >> > -			__func__, dbg_fname);
> >> > -		return;
> >> > -	}
> >> > +	debugfs_create_file(dbg_fname, 0666, kvm_debugfs_dir, vcpu,
> >> > +			    &kvmppc_exit_timing_fops);
> >> > +
> >> >  
> >> >  	vcpu->arch.debugfs_exit_timing = debugfs_file;
> >
> > Ugh, you are right, how did I miss that?  How is 0-day missing this?
> > It's been in my tree for a long time, odd.
> 
> This code isn't enabled by default, or in any defconfig. So it's only
> allmodconfig that would trip it, I guess 0-day isn't doing powerpc
> allmodconfig builds.
> 
> >> I squashed this in, which seems to work:
> ...
> >>  
> >>  void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
> >>  {
> >> -       if (vcpu->arch.debugfs_exit_timing) {
> >> +       if (!IS_ERR_OR_NULL(vcpu->arch.debugfs_exit_timing)) {
> >>                 debugfs_remove(vcpu->arch.debugfs_exit_timing);
> >>                 vcpu->arch.debugfs_exit_timing = NULL;
> >>         }
> >
> > No, this can just be:
> > 	debugfs_remove(vcpu->arch.debugfs_exit_timing);
> >
> > No need to check anything, just call it and the debugfs code can handle
> > it just fine.
> 
> Oh duh, of course, I should have checked.
> 
> I'd still like to NULL out the debugfs_exit_timing member, so I'll do:
> 
> void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
> {
> 	debugfs_remove(vcpu->arch.debugfs_exit_timing);
> 	vcpu->arch.debugfs_exit_timing = NULL;
> }

Fair enough, but I doubt it ever matters :)

Thanks for the fixups, sorry for sending a broken patch, my fault.

greg k-h
