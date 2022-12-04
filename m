Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C259641CAB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 12:37:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ4RB0Y44z3bhn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 22:37:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fg/G4+oX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.216; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fg/G4+oX;
	dkim-atps=neutral
X-Greylist: delayed 165 seconds by postgrey-1.36 at boromir; Sun, 04 Dec 2022 22:36:35 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ4QC2rBpz3bN7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 22:36:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1670153607;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=JOoZ5TPsQh6c+G5freHuXTKIvnKAOMnbqMkScWV44IE=;
    b=fg/G4+oXvG+JN+MCkq3sdFp59JUYl10jCzkMZYOeUHO1OaKp+sXoVnaBERSG4awUXV
    C4IoGHt/pvBkbOkYc183jhwUYlV7J9/mzvnEtyLiBRSy+UMa3g4EFQg/aWh1WBerMYbO
    ppJMqVlBDuR+vDkJPZEFabeqYesTHEe1DcJsfI5SVE+aYuEIXPpTdKU2zSkYYoL9EL6F
    KerjNhZ/ZKWPC8G/WOpBWb+bERGV0AOu9NXK39saEeDS9hJSd5Cg1FRxchGrIuyUIUuY
    EVEpaERlLanI14/wGOADemz2tz1+zHHhHKFd2UJvi5pMBhj8OazRF2Blw3R5qKFnYz1S
    zUrA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiD6Iv9t+Ju2Dhgae599ixpr/qFMA=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:f153:4ac5:8bfd:7188]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdyB4BXQzSk
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 4 Dec 2022 12:33:26 +0100 (CET)
Message-ID: <fc43f9eb-a60f-5c4a-a694-83029234a9c4@xenosoft.de>
Date: Sun, 4 Dec 2022 12:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: qemu-ppc@nongnu.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Matthew Leaman <matthew@a-eon.biz>, Darren Stevens <darren@stevens-zone.net>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

We regularly use QEMU with KVM HV on our A-EON AmigaOne X5000 machines 
(book3e). It works fast and without any problems.

Screenshot tour of QEMU/KVM HV on our AmigaOnes:

- https://i.ibb.co/m4vgwNT/Kernel-6-1-rc3-Power-PC.png
- https://i.ibb.co/Fwdjf7Z/Kernel-6-0-rc6-Power-PC.png
- https://i.ibb.co/LYnJGdF/Kernel-5-19-rc5-Power-PC-2.png
- https://i.ibb.co/vz1Wm5z/QEMU-with-9p-and-USB-sound.png
- https://i.ibb.co/ScMjtp7/Kernel-5-17-alpha5-Power-PC.png
- https://i.ibb.co/LQryFcK/Kernel-5-17-alpha4-Power-PC.png
- https://i.ibb.co/kKLx9mf/Kernel-5-10-89-Power-PC.png
- https://i.ibb.co/LRG1RDV/Kernel-5-10-89-Power-PC-2.png
- https://i.ibb.co/NCFqY0k/QEMU-USB-Audio-on-Void-PPC.png
- https://i.ibb.co/N1vL5Kd/Kernel-5-16-alpha3-Power-PC.png
- https://i.ibb.co/SwjTyJk/Kernel-5-16-alpha1-Power-PC.png
- https://i.ibb.co/LkpWNPx/Kernel-5-15-rc5-Power-PC.png
- https://i.ibb.co/F8q1jDR/Kernel-5-15-rc4-Power-PC.png
- https://i.ibb.co/zZxrbhV/Kernel-5-15-alpha6-Power-PC.png
- 
https://i.pinimg.com/originals/a8/8b/42/a88b422870201887fc01ef44ddc1a235.png
- 
https://i.pinimg.com/originals/57/d9/83/57d98324cd055b7ae00a87ad5a45a42f.png
- 
https://i.pinimg.com/originals/f2/a5/e3/f2a5e34e2015381b0cb87cc51232a8bc.png
- 
https://i.pinimg.com/originals/c5/0d/85/c50d85d7e8f20b4caa1a439faf751964.png
- 
https://i.pinimg.com/originals/6e/3b/59/6e3b59fe10276c5644b15622a81f43f1.png

We solved some issues:

- https://forum.hyperion-entertainment.com/viewtopic.php?p=54357#p54357
- https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236307.html
- https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/249021.html
- https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-May/229103.html
- https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223342.html
- https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216379.html
- 
https://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4655&p=53393&hilit=KVM#p53393
- https://forum.hyperion-entertainment.com/viewtopic.php?p=53209#p53209

Please, do not remove KVM support from Book3e because it works without 
any problems and fast. We need it for our work.

Thanks,
Christian




     On 12/2/22 12:04, Daniel Henrique Barboza wrote:

         On 11/30/22 17:45, Crystal Wood wrote:

             On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:

                 BookE KVM is in a deep maintenance state, I'm not sure 
how much testing
                 it gets. I don't have a test setup, and it does not 
look like QEMU has
                 any HV architecture enabled. It hasn't been too painful 
but there are
                 some cases where it causes a bit of problem not being 
able to test, e.g.,

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.html

                 Time to begin removal process, or are there still 
people using it? I'm
                 happy to to keep making occasional patches to try keep 
it going if
                 there are people testing upstream. Getting HV support 
into QEMU would
                 help with long term support, not sure how big of a job 
that would be.


             Not sure what you mean about QEMU not having e500 HV 
support?  I don't know if
             it's bitrotted, but it's there.


         AFAIK all QEMU ppc boards, aside from pSeries and the Mac ones, 
are always used
         in
         emulated mode in an use case similar to what Bernhard described 
in his reply
         (run
         in x86 due to lack of ppc hardware).

         I am not aware of e500 KVM support in QEMU since I never 
attempted it. But yes,
         it is present, but poorly tested - if tested at all. And the 
reason why there's
         no push on our side to removed it from QEMU is because its code 
is so entwined
         with pSeries KVM that it would take too much effort.

         Do not take the presence of e500 KVM support in QEMU as a 
blocker to disabled
         it in
         the kernel. As far as the current QEMU usage goes e500 KVM can 
be removed
         without
         too much drama from our side.

         Cedric, do you have any opinions about it?



     I can not tell how much e500 KVM is used. The last report we had
     on the topic was :

https://lore.kernel.org/all/R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it/

     and the last commit mentioning e500 VMs I could find is cb3778a045,
     which brings us back to QEMU 2.2 or so.

     It would be nice to 'quickly' check the state of the KVM stack on
     such boards and, may be, plan for more cleanups.


     Thanks,

     C.



         Daniel



             I don't know whether anyone is still using this, but if 
they are, it's
             probably e500mc and not e500v2 (which involved a bunch of 
hacks to get almost-
             sorta-usable performance out of hardware not designed for 
virtualization).  I
             do see that there have been a few recent patches on QEMU 
e500 (beyond the
             treewide cleanup type stuff), though I don't know if 
they're using KVM.  CCing
             them and the QEMU list.

             I have an e6500 I could occasionally test on, if it turns 
out people do still
             care about this.  Don't count me as the use case, though. :-)

             FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to 
be done in
             kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 
to be "cleaner and
             faster". :-P

             -Crystal



Dear all,
please, do not proceed removing KVM support to Book3e.

The PowerProgressCommunity, our not-for-profit organisation of PowerPC 
and alternative platforms enthusiasts is in the process of hardware 
testing our new “Powerboard Tyche”, a fully open hardware motherboard 
for a laptop based on a NXP T2080 which is a Book3e e6500 CPU (4 
physical cores, 8 logical cores), see our recent blog post about it
https://www.powerpc-notebook.org/2022/12/prototypes-produced-lets-go-on-hardware-tests/

With such a board we hope to have a new small niche group of users of a 
PowerPC Book3e platform that will be more than happy to keep using QEMU 
with KVM enabled as using VMs without KVM is way too slow.

At the moment we still have a working NXP DevKit based on the same T2080 
CPU and thank to a patch submitted back in December 2021 we can use QEMU 
with KVM enable on it.
The only issue we have so far is that it only starts when setting it as 
“e5500” (that does not have altivec) because starting it with e6500 
(that has altivec) it does not start.

We published a blog post about QEMU with KVM enable back in December 
2021, I made a screenshot with multiple QEMU instances
https://www.powerpc-notebook.org/2021/12/december-2021-updates-facing-electronic-components-shortages/

I am also aware of users of the A-Eon AmigaOne X5000 computers (still 
being produced and sold) that successfully use QEMU with KVM enabled, 
their system are based either on a NXP P5020 or P5040, both Book3e 
e5500, so without altivec.

So, again, please, do not remove KVM support to Book3e we need that!

Regards,
Mario

