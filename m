Return-Path: <linuxppc-dev+bounces-16472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C+DFSJFfWkaRQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:56:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E5BF758
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2tFT4fvLz2yDY;
	Sat, 31 Jan 2026 10:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769817373;
	cv=none; b=fjkiN+C0gBHhezuiBK3zI53NGRrVsBIaX0ITZnwF2TSp3tvTvsQtt4u0SzgPnpCND0Rq7An+T1iNtjPSKUdLoSYctoTgjM8FGheGzNpFSnE/orsJEQGC0IM6Ia0NBJjxzgWFsntW3Qf2v62OrQEp9Aku1d/W0aF23qrtPQ6ATc5jLR9tNBwboWnlqPr7y0b7moNEq7uJOnMPZEift3RRC9Kht8mf6HBnmjpfNlf6FWUhEVvk0BmDq9o+t3NI4+fU7busaxHVLENJx3SW/wrLdrC6T+oykbKRcxUFfSVfN4HnRmZCiUGFNvQ06g+NiGWYjRGuDM3Uz/kEuXlNyJeKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769817373; c=relaxed/relaxed;
	bh=WunDx0fb3GW0z9IYkcolqOlpoStL9vS1z9b/3h7/9sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq2V9RDh9K5a7dURpZTR8AKqTxIvATZ3KkK2UHwuWfMVZQaQfNIcBC8r4eEcIrJQmn+9A6Emw1qhPFV8j/wN05u3cLc97V47t3Ruix1/hXFAG42jNWvlyLDBnayvbB+q7TyeALqjXR+lUcH6GZBk61ZFw/XJU2MFq1eWGVfDGRKFsHF1eBGZUYpSldJta4ezNmMlXZj+JU1OP3RQuS0zKI/FolTupMbiCe5sQI6OWkwmhB6M1DyGQhiI+dBJYsLxBuyqeC5WnSHV7SWTXoBHAm2Ny2B2iFUH6pLRAGe6cKAFzX2MHSDikZkmEfleHMX7l+OEpAPGaWa6iWe7+1durA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=AO+G3MI/; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=AO+G3MI/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2tFQ3M3xz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 10:56:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=WunDx0fb3GW0z9IYkcolqOlpoStL9vS1z9b/3h7/9sA=; b=AO+G3MI/5/op50vRQvZ2KSjky2
	o2ePb5Zukk3sXqeoNldFFJbSdw+Qp7uPktsF7JIRKDMKPcu/acltZPsnYWSewa2lLpyc2Gx9MlnMF
	O3a5gu9xLnoZ1RZqF9iA05zLoPaHp5rsq+K1gR3L76DF8WbF9zlg8f6xM6E2G1VQAn9TaPm+Tk5Y2
	s5bwYJffBoYET1FOa8HR7vJwT9oiZweshSD1mXBXH7uapwklcxfNchd2/QTs+ZWS3FHEhaI0q2NAO
	4iOY76PwJp8GPEtE84eZvCDEagFHnDbFvVFgCapOv8se+c1FU82xSEGXvHZNGQbgXWrdNVN6O9s2V
	gVLXLJfQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vlyMx-0000000ChF7-0kg1;
	Fri, 30 Jan 2026 23:57:43 +0000
Date: Fri, 30 Jan 2026 23:57:43 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Samuel Wu <wusamuel@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, clm@meta.com,
	android-kernel-team <android-kernel-team@google.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
Message-ID: <20260130235743.GW3183987@ZenIV>
References: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh>
 <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
 <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV>
 <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV>
 <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zeniv.linux.org.uk,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.org.uk:s=zeniv-20220401];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16472-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.org.uk:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,linux.org.uk:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5F0E5BF758
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 02:31:54PM -0800, Samuel Wu wrote:
> On Thu, Jan 29, 2026 at 11:02 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > OK.  Could you take a clone of mainline repository and in there run
> > ; git fetch git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git for-wsamuel:for-wsamuel
> > then
> > ; git diff for-wsamuel e5bf5ee26663
> > to verify that for-wsamuel is identical to tree you've seen breakage on
> > ; git diff for-wsamuel-base 1544775687f0
> > to verify that for-wsamuel-base is the tree where the breakage did not reproduce
> > Then bisect from for-wsamuel-base to for-wsamuel.
> >
> > Basically, that's the offending commit split into steps; let's try to figure
> > out what causes the breakage with better resolution...
> 
> Confirming that bisect points to this patch: 09e88dc22ea2 (serialize
> ffs_ep0_open() on ffs->mutex)

So we have something that does O_NDELAY opens of ep0 *and* does not retry on
EAGAIN?

How lovely...  Could you slap
	WARN_ON(ret == -EAGAIN);
right before that
	if (ret < 0)
		return ret;
in there and see which process is doing that?  Regression is a regression, 
odd userland or not, but I would like to see what is that userland actually
trying to do there.

*grumble*

IMO at that point we have two problems - one is how to avoid a revert of the
tail of tree-in-dcache series, another is how to deal with quite real
preexisting bugs in functionfs.

Another thing to try (not as a suggestion of a fix, just an attempt to figure
out how badly would the things break): in current mainline replace that
	ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK)
in ffs_ep0_open() with
	ffs_mutex_lock(&ffs->mutex, false)
and see how badly do the things regress for userland.  Again, I'm not saying
that this is a fix - just trying to get some sense of what's the userland
is doing.

FWIW, it might make sense to try a lighter serialization in ffs_ep0_open() -
taking it there is due to the following scenario (assuming 6.18 or earlier):
ffs->state is FFS_DEACTIVATED.  ffs->opened is 0.  Two threads attempt to
open ep0.  Here's what happens prior to these patches:

static int ffs_ep0_open(struct inode *inode, struct file *file)
{
        struct ffs_data *ffs = inode->i_private;
 
        if (ffs->state == FFS_CLOSING)
                return -EBUSY;
 
        file->private_data = ffs;
        ffs_data_opened(ffs);

with
static void ffs_data_opened(struct ffs_data *ffs)
{
        refcount_inc(&ffs->ref);
        if (atomic_add_return(1, &ffs->opened) == 1 &&
                        ffs->state == FFS_DEACTIVATED) {
                ffs->state = FFS_CLOSING;
                ffs_data_reset(ffs);
        }
}

IOW, the sequence is
	if (state == FFS_CLOSING)
		return -EBUSY;
	n = atomic_add_return(1, &opened);
	if (n == 1 && state == FFS_DEACTIVATED) {
		state = FFS_CLOSING;
		ffs_data_reset();

See the race there?  If the second open() comes between the
increment of ffs->opened and setting the state to FFS_CLOSING,
it will *not* fail with EBUSY - it will proceed to return to
userland, while the first sucker is crawling through the work
in ffs_data_reset()/ffs_data_clear()/ffs_epfiles_destroy().

What's more, there's nothing to stop that second opener from
calling write() on the descriptor it got.  No exclusion there -
        ffs->state = FFS_READ_DESCRIPTORS;
        ffs->setup_state = FFS_NO_SETUP;
        ffs->flags = 0;
in ffs_data_reset() is *not* serialized against ffs_ep0_write().
Get preempted right after setting ->state and that write()
will go just fine, only to be surprised when the first thread
regains CPU and continues modifying the contents of *ffs
under whatever the second thread is doing.

That code obviously relies upon that kind of shit being prevented
by that -EBUSY logics in ep0 open() and that logics is obviously
racy as it is.  Note that other callers of ffs_data_reset() have
similar problem: ffs_func_set_alt(), for example has
        if (ffs->state == FFS_DEACTIVATED) {
                ffs->state = FFS_CLOSING;
                INIT_WORK(&ffs->reset_work, ffs_reset_work);
                schedule_work(&ffs->reset_work);
                return -ENODEV;
        }
again, with no exclusion.  Lose CPU just after seeing FFS_DEACTIVATED,
then have another thread open() the sucker and start going through
ffs_data_reset(), only to have us regain CPU and schedule this for
execution:
static void ffs_reset_work(struct work_struct *work)
{
        struct ffs_data *ffs = container_of(work,
                struct ffs_data, reset_work);
        ffs_data_reset(ffs);
}
IOW, stray ffs_data_reset() coming to surprise the opener who'd
just finished ffs_data_reset() during open(2) and proceeded to
write to the damn thing, etc.

That's obviously on the "how do we fix the preexisting bugs" side
of things, though - regression needs to be dealt with ASAP anyway.

