Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF217744E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 11:34:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WtfW5x7wzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 21:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WtcN5PrbzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 21:32:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eiOxIkKN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48WtcN0RCtz9sPg;
 Tue,  3 Mar 2020 21:32:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583231540;
 bh=plIVQelLQN+Lhv6LVRXDSOs7Mt1qf+ql5n8cFWM5qC8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eiOxIkKNxkhy8BuTzjl2C8S7V8FWoaXiEldT4NoOUCn0HUgadrF25e6taTW9pGf1w
 5I64che4K4w228Sj/uxYo0Lw7zi0NJjb+VsYtmOZwU+/3dWjkAe1KfsvGDFG6m/UzB
 KOq6cXj4eEXSpsYkJZof2d1KTxZXD8vGFxOjR3LtMhC9R1Bw2S9CzzZXBjXFVje9UQ
 1O9maQhH6RCyv5+xSdQjDZmwIHeFuU5Fkodz+72JYsA+9qrBTZn72OuwphM2O6LJBQ
 1PF7WZ2ARePgjBcFQGFGN6d8fq3RlFSulZrELavsjYJSYO0TEBe+MUaH6ofC8U3KmR
 m8X8oF93qTwJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/6] powerpc: kvm: no need to check return value of
 debugfs_create functions
In-Reply-To: <20200303095849.GA1399072@kroah.com>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
 <20200209105901.1620958-2-gregkh@linuxfoundation.org>
 <87imjlswxc.fsf@mpe.ellerman.id.au> <20200303085039.GA1323622@kroah.com>
 <87d09tsrf0.fsf@mpe.ellerman.id.au> <20200303095849.GA1399072@kroah.com>
Date: Tue, 03 Mar 2020 21:32:19 +1100
Message-ID: <874kv5sp8s.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Tue, Mar 03, 2020 at 08:45:23PM +1100, Michael Ellerman wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> > On Tue, Mar 03, 2020 at 06:46:23PM +1100, Michael Ellerman wrote:
>> >> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> >> > When calling debugfs functions, there is no need to ever check the
>> >> > return value.  The function can work or not, but the code logic should
>> >> > never do something different based on this.
>> >> 
>> >> Except it does need to do something different, if the file was created
>> >> it needs to be removed in the remove path.
>> >> 
>> >> > diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
>> >> > index bfe4f106cffc..8e4791c6f2af 100644
>> >> > --- a/arch/powerpc/kvm/timing.c
>> >> > +++ b/arch/powerpc/kvm/timing.c
>> >> > @@ -207,19 +207,12 @@ static const struct file_operations kvmppc_exit_timing_fops = {
>> >> >  void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id)
>> >> >  {
>> >> >  	static char dbg_fname[50];
>> >> > -	struct dentry *debugfs_file;
>> >> >  
>> >> >  	snprintf(dbg_fname, sizeof(dbg_fname), "vm%u_vcpu%u_timing",
>> >> >  		 current->pid, id);
>> >> > -	debugfs_file = debugfs_create_file(dbg_fname, 0666,
>> >> > -					kvm_debugfs_dir, vcpu,
>> >> > -					&kvmppc_exit_timing_fops);
>> >> > -
>> >> > -	if (!debugfs_file) {
>> >> > -		printk(KERN_ERR"%s: error creating debugfs file %s\n",
>> >> > -			__func__, dbg_fname);
>> >> > -		return;
>> >> > -	}
>> >> > +	debugfs_create_file(dbg_fname, 0666, kvm_debugfs_dir, vcpu,
>> >> > +			    &kvmppc_exit_timing_fops);
>> >> > +
>> >> >  
>> >> >  	vcpu->arch.debugfs_exit_timing = debugfs_file;
>> >
>> > Ugh, you are right, how did I miss that?  How is 0-day missing this?
>> > It's been in my tree for a long time, odd.
>> 
>> This code isn't enabled by default, or in any defconfig. So it's only
>> allmodconfig that would trip it, I guess 0-day isn't doing powerpc
>> allmodconfig builds.
>> 
>> >> I squashed this in, which seems to work:
>> ...
>> >>  
>> >>  void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
>> >>  {
>> >> -       if (vcpu->arch.debugfs_exit_timing) {
>> >> +       if (!IS_ERR_OR_NULL(vcpu->arch.debugfs_exit_timing)) {
>> >>                 debugfs_remove(vcpu->arch.debugfs_exit_timing);
>> >>                 vcpu->arch.debugfs_exit_timing = NULL;
>> >>         }
>> >
>> > No, this can just be:
>> > 	debugfs_remove(vcpu->arch.debugfs_exit_timing);
>> >
>> > No need to check anything, just call it and the debugfs code can handle
>> > it just fine.
>> 
>> Oh duh, of course, I should have checked.
>> 
>> I'd still like to NULL out the debugfs_exit_timing member, so I'll do:
>> 
>> void kvmppc_remove_vcpu_debugfs(struct kvm_vcpu *vcpu)
>> {
>> 	debugfs_remove(vcpu->arch.debugfs_exit_timing);
>> 	vcpu->arch.debugfs_exit_timing = NULL;
>> }
>
> Fair enough, but I doubt it ever matters :)

Yeah, but I'm paranoid and I have no way to test this code :)

> Thanks for the fixups, sorry for sending a broken patch, my fault.

No worries, we have too many CONFIG options.

cheers
