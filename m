Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46155154633
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 15:31:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D17s6S3LzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 01:31:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D15G3l2vzDqV9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 01:28:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=bZFMyrpM; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48D15G2LTCz8swr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 01:28:50 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48D15G1wX6z9sRG; Fri,  7 Feb 2020 01:28:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::1;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=bZFMyrpM; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48D15F3MCTz9s3x
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Feb 2020 01:28:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580999323;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=m8YS/QWbAuZBVFtsr7hO2HWlKHxq+32ds22S6vZN0aA=;
 b=bZFMyrpM52ilzn/iYmVAH0IOPdhx5VBnG+eaTCm4TnIkPaSrOVWGANXn0VMtJ1APIK
 khLxQlvo3W4+v4rK85FXzdOcj65O1fNeDNsdT7feZVyCPgFnOSSGdn/vQuJqKJONebpg
 ZuwuAfkpbfXVTcZFpH73gNXpI0jY3WQG/6dn1jBB8TiOZNfMwySymQoEpb1X6f3BxWVs
 S5wrYlVHgOk4UcP6veUtzjJ5s9bpAh9WC+4hVt9IhNf2tVo0R7J8o2lqJH5Tb5lP7xBK
 Wyd/i1GwaSfHmch/cwV5fTI/gVhTkVeY0tpBucarVRPjCgFWKhHZtDWTyzUWlq3mZ581
 BkGA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhaLukTGHvIso26evMpB0Xs05Kjiw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:9861:356d:d6ca:1eb6]
 by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 40bcf3w16ESKZZ7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 Feb 2020 15:28:20 +0100 (CET)
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
To: Michael Ellerman <mpe@ellerman.id.au>, Jakub Kicinski <kuba@kernel.org>
References: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
 <C11859E1-BE71-494F-81E2-9B27E27E60EE@xenosoft.de>
 <87tv441gg1.fsf@mpe.ellerman.id.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <f438e4ed-7746-1d80-6d72-455281884a1e@xenosoft.de>
Date: Thu, 6 Feb 2020 15:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87tv441gg1.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06 February 2020 at 05:35 am, Michael Ellerman wrote:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> Kernel 5.5 PowerPC is also affected.
> I don't know what you mean by that. What sha are you talking about?
>
> I have a system with avahi running and everything's fine.
>
>    # grep use- /etc/avahi/avahi-daemon.conf
>    use-ipv4=yes
>    use-ipv6=yes
>    
>    # systemctl status -l --no-pager avahi-daemon
>    ● avahi-daemon.service - Avahi mDNS/DNS-SD Stack
>       Loaded: loaded (/lib/systemd/system/avahi-daemon.service; enabled; vendor preset: enabled)
>       Active: active (running) since Thu 2020-02-06 14:55:34 AEDT; 38min ago
>     Main PID: 1884 (avahi-daemon)
>       Status: "avahi-daemon 0.7 starting up."
>       CGroup: /system.slice/avahi-daemon.service
>               ├─1884 avahi-daemon: running [mpe-ubuntu-le.local]
>               └─1888 avahi-daemon: chroot helper
>    
>    Feb 06 14:55:34 mpe-ubuntu-le avahi-daemon[1884]: Registering new address record for fe80::5054:ff:fe66:2a19 on eth0.*.
>    Feb 06 14:55:34 mpe-ubuntu-le avahi-daemon[1884]: Registering new address record for 10.61.141.81 on eth0.IPv4.
>    Feb 06 14:55:34 mpe-ubuntu-le avahi-daemon[1884]: Registering new address record for ::1 on lo.*.
>    Feb 06 14:55:34 mpe-ubuntu-le avahi-daemon[1884]: Registering new address record for 127.0.0.1 on lo.IPv4.
>    Feb 06 14:55:34 mpe-ubuntu-le systemd[1]: Started Avahi mDNS/DNS-SD Stack.
>    Feb 06 14:55:35 mpe-ubuntu-le avahi-daemon[1884]: Server startup complete. Host name is mpe-ubuntu-le.local. Local service cookie is 3972418141.
>    Feb 06 14:55:38 mpe-ubuntu-le avahi-daemon[1884]: Leaving mDNS multicast group on interface eth0.IPv6 with address fe80::5054:ff:fe66:2a19.
>    Feb 06 14:55:38 mpe-ubuntu-le avahi-daemon[1884]: Joining mDNS multicast group on interface eth0.IPv6 with address fd69:d75f:b8b5:61:5054:ff:fe66:2a19.
>    Feb 06 14:55:38 mpe-ubuntu-le avahi-daemon[1884]: Registering new address record for fd69:d75f:b8b5:61:5054:ff:fe66:2a19 on eth0.*.
>    Feb 06 14:55:38 mpe-ubuntu-le avahi-daemon[1884]: Withdrawing address record for fe80::5054:ff:fe66:2a19 on eth0.
>    
>    # uname -r
>    5.5.0-gcc-8.2.0
>
>
> The key question is what ioctl is it complaining about. You should be
> able to find that via strace.
>
> cheers
>
Hello Michael,

Sorry it isn't true that the kernel 5.5 is also affected. A Power Mac G5 
user told me that but this isn't correct. I compiled and tested the 
stable kernel 5.5.1 and 5.5.2 today and both kernels don't have the 
issue with the avahi daemon.
Could you please also test the latest Git kernel?

strace /usr/sbin/avahi-daemon

...
poll([{fd=4, events=POLLIN}, {fd=16, events=POLLIN}, {fd=15, 
events=POLLIN}, {fd=14, events=POLLIN}, {fd=13, events=POLLIN}, {fd=12, 
events=POLLIN}, {fd=11, events=POLLIN}, {fd=10, events=POLLIN}, {fd=9, 
events=POLLIN}, {fd=8, events=POLLIN}, {fd=6, events=POLLIN}], 11, 65) = 
2 ([{fd=12, revents=POLLIN}, {fd=9, revents=POLLIN}])
ioctl(12, FIONREAD, 0xffba6f24)         = -1 ENOTTY (Inappropriate ioctl 
for device)
write(2, "ioctl(): Inappropriate ioctl for"..., 39ioctl(): Inappropriate 
ioctl for device) = 39
write(2, "\n", 1
)                       = 1
...

Thanks,
Christian
