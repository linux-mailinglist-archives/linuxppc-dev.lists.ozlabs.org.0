Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BEF1D471E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 09:33:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NgBZ4RVlzDqyx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 17:33:42 +1000 (AEST)
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
 header.s=default header.b=taSYDwaC; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ng7B3YBnzDqth
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:30:46 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B74F720657;
 Fri, 15 May 2020 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589527843;
 bh=bo3SV/DRboM6sAdeWzwHkYDe64HFbrSpWpwe/V8CLqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=taSYDwaCzNvNih4cdkjhzBjo52huDb4klZ1kTXDNMrwDNDLH/0NcP73X85CP8MzJ9
 PGGbEtVNCzGHebVmw/no88rbcUEVyY6GEVF4OsyRBuHMIVtza0KHWSziwPLtJe36ka
 iqT5DMno47qSOaLT4DyNzCnxBdyh07Yu9MFKzlqI=
Date: Fri, 15 May 2020 09:30:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rananta@codeaurora.org
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
Message-ID: <20200515073041.GB1361563@kroah.com>
References: <20200506094851.GA2787548@kroah.com>
 <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
 <20200510064819.GB3400311@kroah.com>
 <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
 <20200511073913.GA1347819@kroah.com>
 <0f7791f5-0a53-59f6-7277-247a789f30c2@suse.cz>
 <20200512082551.GA3526567@kroah.com>
 <417b1d320bda37410788430979dd708d@codeaurora.org>
 <20200513070403.GB764901@kroah.com>
 <0ab0b49f19b824ac1c4db4c4937ed388@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab0b49f19b824ac1c4db4c4937ed388@codeaurora.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, andrew@daynix.com,
 Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 04:22:10PM -0700, rananta@codeaurora.org wrote:
> On 2020-05-13 00:04, Greg KH wrote:
> > On Tue, May 12, 2020 at 02:39:50PM -0700, rananta@codeaurora.org wrote:
> > > On 2020-05-12 01:25, Greg KH wrote:
> > > > On Tue, May 12, 2020 at 09:22:15AM +0200, Jiri Slaby wrote:
> > > > > On 11. 05. 20, 9:39, Greg KH wrote:
> > > > > > On Mon, May 11, 2020 at 12:23:58AM -0700, rananta@codeaurora.org wrote:
> > > > > >> On 2020-05-09 23:48, Greg KH wrote:
> > > > > >>> On Sat, May 09, 2020 at 06:30:56PM -0700, rananta@codeaurora.org wrote:
> > > > > >>>> On 2020-05-06 02:48, Greg KH wrote:
> > > > > >>>>> On Mon, Apr 27, 2020 at 08:26:01PM -0700, Raghavendra Rao Ananta wrote:
> > > > > >>>>>> Potentially, hvc_open() can be called in parallel when two tasks calls
> > > > > >>>>>> open() on /dev/hvcX. In such a scenario, if the
> > > > > >>>>>> hp->ops->notifier_add()
> > > > > >>>>>> callback in the function fails, where it sets the tty->driver_data to
> > > > > >>>>>> NULL, the parallel hvc_open() can see this NULL and cause a memory
> > > > > >>>>>> abort.
> > > > > >>>>>> Hence, serialize hvc_open and check if tty->private_data is NULL
> > > > > >>>>>> before
> > > > > >>>>>> proceeding ahead.
> > > > > >>>>>>
> > > > > >>>>>> The issue can be easily reproduced by launching two tasks
> > > > > >>>>>> simultaneously
> > > > > >>>>>> that does nothing but open() and close() on /dev/hvcX.
> > > > > >>>>>> For example:
> > > > > >>>>>> $ ./simple_open_close /dev/hvc0 & ./simple_open_close /dev/hvc0 &
> > > > > >>>>>>
> > > > > >>>>>> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> > > > > >>>>>> ---
> > > > > >>>>>>  drivers/tty/hvc/hvc_console.c | 16 ++++++++++++++--
> > > > > >>>>>>  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > > >>>>>>
> > > > > >>>>>> diff --git a/drivers/tty/hvc/hvc_console.c
> > > > > >>>>>> b/drivers/tty/hvc/hvc_console.c
> > > > > >>>>>> index 436cc51c92c3..ebe26fe5ac09 100644
> > > > > >>>>>> --- a/drivers/tty/hvc/hvc_console.c
> > > > > >>>>>> +++ b/drivers/tty/hvc/hvc_console.c
> > > > > >>>>>> @@ -75,6 +75,8 @@ static LIST_HEAD(hvc_structs);
> > > > > >>>>>>   */
> > > > > >>>>>>  static DEFINE_MUTEX(hvc_structs_mutex);
> > > > > >>>>>>
> > > > > >>>>>> +/* Mutex to serialize hvc_open */
> > > > > >>>>>> +static DEFINE_MUTEX(hvc_open_mutex);
> > > > > >>>>>>  /*
> > > > > >>>>>>   * This value is used to assign a tty->index value to a hvc_struct
> > > > > >>>>>> based
> > > > > >>>>>>   * upon order of exposure via hvc_probe(), when we can not match it
> > > > > >>>>>> to
> > > > > >>>>>> @@ -346,16 +348,24 @@ static int hvc_install(struct tty_driver
> > > > > >>>>>> *driver, struct tty_struct *tty)
> > > > > >>>>>>   */
> > > > > >>>>>>  static int hvc_open(struct tty_struct *tty, struct file * filp)
> > > > > >>>>>>  {
> > > > > >>>>>> -	struct hvc_struct *hp = tty->driver_data;
> > > > > >>>>>> +	struct hvc_struct *hp;
> > > > > >>>>>>  	unsigned long flags;
> > > > > >>>>>>  	int rc = 0;
> > > > > >>>>>>
> > > > > >>>>>> +	mutex_lock(&hvc_open_mutex);
> > > > > >>>>>> +
> > > > > >>>>>> +	hp = tty->driver_data;
> > > > > >>>>>> +	if (!hp) {
> > > > > >>>>>> +		rc = -EIO;
> > > > > >>>>>> +		goto out;
> > > > > >>>>>> +	}
> > > > > >>>>>> +
> > > > > >>>>>>  	spin_lock_irqsave(&hp->port.lock, flags);
> > > > > >>>>>>  	/* Check and then increment for fast path open. */
> > > > > >>>>>>  	if (hp->port.count++ > 0) {
> > > > > >>>>>>  		spin_unlock_irqrestore(&hp->port.lock, flags);
> > > > > >>>>>>  		hvc_kick();
> > > > > >>>>>> -		return 0;
> > > > > >>>>>> +		goto out;
> > > > > >>>>>>  	} /* else count == 0 */
> > > > > >>>>>>  	spin_unlock_irqrestore(&hp->port.lock, flags);
> > > > > >>>>>
> > > > > >>>>> Wait, why isn't this driver just calling tty_port_open() instead of
> > > > > >>>>> trying to open-code all of this?
> > > > > >>>>>
> > > > > >>>>> Keeping a single mutext for open will not protect it from close, it will
> > > > > >>>>> just slow things down a bit.  There should already be a tty lock held by
> > > > > >>>>> the tty core for open() to keep it from racing things, right?
> > > > > >>>> The tty lock should have been held, but not likely across
> > > > > >>>> ->install() and
> > > > > >>>> ->open() callbacks, thus resulting in a race between hvc_install() and
> > > > > >>>> hvc_open(),
> > > > > >>>
> > > > > >>> How?  The tty lock is held in install, and should not conflict with
> > > > > >>> open(), otherwise, we would be seeing this happen in all tty drivers,
> > > > > >>> right?
> > > > > >>>
> > > > > >> Well, I was expecting the same, but IIRC, I see that the open() was being
> > > > > >> called in parallel for the same device node.
> > > > > >
> > > > > > So open and install are happening at the same time?  And the tty_lock()
> > > > > > does not protect the needed fields from being protected properly?  If
> > > > > > not, what fields are being touched without the lock?
> > > > > >
> > > > > >> Is it expected that the tty core would allow only one thread to
> > > > > >> access the dev-node, while blocking the other, or is it the client
> > > > > >> driver's responsibility to handle the exclusiveness?
> > > > > >
> > > > > > The tty core should handle this correctly, for things that can mess
> > > > > > stuff up (like install and open at the same time).  A driver should not
> > > > > > have to worry about that.
> > > > > >
> > > > > >>>> where hvc_install() sets a data and the hvc_open() clears it.
> > > > > >>>> hvc_open()
> > > > > >>>> doesn't
> > > > > >>>> check if the data was set to NULL and proceeds.
> > > > > >>>
> > > > > >>> What data is being set that hvc_open is checking?
> > > > > >> hvc_install sets tty->private_data to hp, while hvc_open sets it to NULL (in
> > > > > >> one of the paths).
> > > > > >
> > > > > > I see no use of private_data in drivers/tty/hvc/ so what exactly are you
> > > > > > referring to?
> > > > >
> > > > > He likely means tty->driver_data. And there exactly lays the issue.
> > > > >
> > > > > commit bdb498c20040616e94b05c31a0ceb3e134b7e829
> > > > > Author: Jiri Slaby <jslaby@suse.cz>
> > > > > Date:   Tue Aug 7 21:48:04 2012 +0200
> > > > >
> > > > >     TTY: hvc_console, add tty install
> > > > >
> > > > > added hvc_install but did not move 'tty->driver_data = NULL;' from
> > > > > hvc_open's fail path to hvc_cleanup.
> > > > >
> > > > > IOW hvc_open now NULLs tty->driver_data even for another task which
> > > > > opened the tty earlier. The same holds for
> > > > > "tty_port_tty_set(&hp->port,
> > > > > NULL);" there. And actually "tty_port_put(&hp->port);" is also
> > > > > incorrect
> > > > > for the 2nd task opening the tty.
> > > > >
> > > > > So, a mutex with tty->driver_data check in open is not definitely the
> > > > > way to go. This mess needs to be sorted out properly. Sure, a good
> > > > > start
> > > > > would be a conversion to tty_port_open. Right after dropping "tty:
> > > > > hvc:
> > > > > Fix data abort due to race in hvc_open" from tty/tty-next :).
> > > >
> > > > I've now reverted this commit so we can start from a "clean" place.
> > > >
> > > > > What I *don't* understand is why hp->ops->notifier_add fails, given
> > > > > the
> > > > > open does not allow multiple opens anyway?
> > > >
> > > > I don't understand that either.  Raghavendra, can you show a real trace
> > > > for this issue that shows this?
> > > >
> > > Let me know if this helps:
> > > 
> > > [  265.332900] Unable to handle kernel NULL pointer dereference at
> > > virtual
> > > address 00000000000000a8
> > > [  265.332920] Mem abort info:
> > > [  265.332934]   ESR = 0x96000006
> > > [  265.332950]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [  265.332963]   SET = 0, FnV = 0
> > > [  265.332975]   EA = 0, S1PTW = 0
> > > [  265.332985] Data abort info:
> > > [  265.332997]   ISV = 0, ISS = 0x00000006
> > > [  265.333008]   CM = 0, WnR = 0
> > > [  265.333025] user pgtable: 4k pages, 39-bit VAs,
> > > pgdp=00000001620f3000
> > > [  265.333038] [00000000000000a8] pgd=00000001620f2003,
> > > pud=00000001620f2003, pmd=0000000000000000
> > > [  265.333071] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> > > [  265.333424] CPU: 1 PID: 5653 Comm: stress-ng-dev Tainted: G S
> > > W  O
> > > 5.4.12-g04866e0 #1
> > > [  265.333458] pstate: 80400085 (Nzcv daIf +PAN -UAO)
> > > [  265.333499] pc : _raw_spin_lock_irqsave+0x40/0x7c
> > > [  265.333517] lr : _raw_spin_lock_irqsave+0x38/0x7c
> > > [  265.333530] sp : ffffffc02436ba40
> > > [  265.333542] x29: ffffffc02436ba40 x28: 0000000000020800
> > > [  265.333562] x27: ffffffdfb4046490 x26: ffffff8101b83400
> > > [  265.333580] x25: ffffff80e163ad00 x24: ffffffdfb45c7798
> > > [  265.333598] x23: ffffff8101b83668 x22: ffffffdfb4974000
> > > [  265.333617] x21: 0000000000000001 x20: 00000000000000a8
> > > [  265.333634] x19: 0000000000000000 x18: ffffff80e0b0d460
> > > [  265.333652] x17: 0000000000000000 x16: 0000000001000000
> > > [  265.333670] x15: 0000000001000000 x14: 00000000f8000000
> > > [  265.333688] x13: 0000000000000000 x12: 0000000000000001
> > > [  265.333706] x11: 17f5f16765f64600 x10: 17f5f16765f64600
> > > [  265.333724] x9 : ffffffdfb3444244 x8 : 0000000000000000
> > > [  265.333741] x7 : 0000000000000000 x6 : 0000000000000000
> > > [  265.333759] x5 : 0000000000000000 x4 : 0000000000000002
> > > [  265.333776] x3 : ffffffc02436b9c0 x2 : ffffffdfb40456e0
> > > [  265.333794] x1 : ffffffc02436b9c0 x0 : ffffffdfb3444244
> > > [  265.333812] Call trace:
> > > [  265.333831]  _raw_spin_lock_irqsave+0x40/0x7c
> > > [  265.333859]  28$61deaf328f140fd7df47c115ec866fa5+0x28/0x174
> > > [  265.333882]  tty_open$86bd494905ebe22944bf63b711173de3+0x3d0/0x584
> > > [  265.333921]
> > > chrdev_open$4083aaa799bca8e0e1e0c8dc1947aa96+0x1c4/0x248
> > > [  265.333940]  do_dentry_open+0x258/0x3b0
> > > [  265.333956]  vfs_open+0x2c/0x38
> > > [  265.333975]  path_openat+0x898/0xedc
> > > [  265.333991]  do_filp_open+0x78/0x124
> > > [  265.334006]  do_sys_open+0x13c/0x298
> > > [  265.334022]  __arm64_sys_openat+0x28/0x34
> > > [  265.334044]  el0_svc_common+0xb8/0x1b4
> > > [  265.334059]  el0_svc_handler+0x6c/0x88
> > > [  265.334079]  el0_svc+0x8/0xc
> > > [  265.334110] Code: 52800035 97b9fec7 aa1f03e8 f9800291 (885ffe81)
> > > [  265.334130] ---[ end trace ac90e3099a98e99f ]---
> > > [  265.334146] Kernel panic - not syncing: Fatal exception
> > 
> > Hm, do you have a strace showing the close happening at the same time?
> > What about install()?
> 
> Yes, I do see the close happening, at which point the issue is not seen.
> It's only seen if the second task came in before this close was called. For
> this task, as the file was already opened, it doesn't go through
> hvc_install.
> 
> (I figured adding some logs in the drivers would be helpful than straces to
> also include hvc_install)
> 
> These are the traces you get when the issue happens:
> [  154.212291] hvc_install called for pid: 666
> [  154.216705] hvc_open called for pid: 666
> [  154.233657] hvc_open: request_irq failed with rc -22.
> [  154.238934] hvc_open called for pid: 678
> [  154.243012] Unable to handle kernel NULL pointer dereference at virtual
> address 00000000000000c4
> # hvc_install isn't called for pid: 678 as the file wasn't closed yet.
> 
> And these are the traces we get when things are normal:
> [   76.318861] hvc_install called for pid: 537
> [   76.323240] hvc_open called for pid: 537
> [   76.340177] hvc_open: request_irq failed with rc -22.
> [   76.345384] hvc_close called for pid: 537
> [   76.349555] hvc_install called for pid: 538
> [   76.353921] hvc_open called for pid: 538
> # hvc_open for the second task (pid: 538) seems to be fine here as the file
> was closed prior to the second task tried to open the file.
> 
> > 
> > And what line in hvc_open() does that offset correspond to?
> It's the point where it tries to acquire the spinlock for the first time:
> spin_lock_irqsave(&hp->port.lock, flags);

Ah, is this a console?  Maybe this is the same issue that other console
drivers have been having recently, look at:
	https://lore.kernel.org/r/20200428184050.6501-1-john.stultz@linaro.org
and
	https://lore.kernel.org/r/1589019852-21505-2-git-send-email-sagar.kadam@sifive.com

Is that what you need here too?

thanks,

greg k-h
