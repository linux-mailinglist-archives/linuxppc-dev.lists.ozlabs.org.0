Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB707D4390
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 02:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=s.l-h@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jk1Fic2b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDsmX0mHlz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 11:06:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=s.l-h@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jk1Fic2b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=s.l-h@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 344 seconds by postgrey-1.37 at boromir; Tue, 24 Oct 2023 10:50:02 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDsPQ4L9Jz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 10:50:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1698104996; x=1698709796; i=s.l-h@gmx.de;
	bh=c12zjGhXuILXy6c+VS+yOhq4DSmbOBdAvoj+0IeHUlQ=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
	 References;
	b=jk1Fic2bPRBY+pZQhC7nMQmvY2pd9BgRJtwk1Bie+D6eBVswy3QBkKy+Bv4FG1fD
	 6MDgHb+KRSWZfrugNCoumc7mGgonwpBwsi5sBUBbpYAhBtPYwBZq/IFwWldJC2MBk
	 9EyNPMU3o6yYX4IUzygPdxmZImxEH3Xt0ImDTgS9h3g5NHxeRwxZ1CQAoWZAQ4Tw7
	 9/pC+n2G033hCRaTNSU+keSWjDMcFxjlDEubuOKQAzhhijYfT9oiq/fFQwvte35t7
	 byM+0yW29PcGSyCqf/8MrR9tDWPUrNh45cRHtwDym7pHgAep38yEHxbz8RBnpBTm1
	 +y5NhiNRcFgjwUbVBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mir ([94.31.85.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1qz2sh2Fog-00VT6g; Tue, 24
 Oct 2023 01:43:09 +0200
Date: Tue, 24 Oct 2023 01:43:02 +0200
From: Stefan Lippers-Hollmann <s.l-h@gmx.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
Message-ID: <20231024014302.0a0b79b0@mir>
In-Reply-To: <20231023131953.2876682-11-arnd@kernel.org>
References: <20231023131953.2876682-1-arnd@kernel.org>
	<20231023131953.2876682-11-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NpIw+SX94egfOhweBUAICPZH64XIjR12TC41Cr5kyAe3nCj2nJU
 W/jSlk3O9a/mEjYbsalglT8krptSsQttKV/p+nmGou04gTFwqgwY68JcCtrWE7Ewn+Q3yEk
 ixE9ud6+7BJVpxWJj+mqc751GtNMzj+UL9EbknOtywXW2D2SwmvVPgKQ7UPPg+khuD1jnvB
 joodVtXZ0hBJst/+AwO2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hPzJNZuJvoY=;jPaaUAY8CVGSYst4wbOcOEXlSEH
 qeRwAgZh1gb3syim4Hy+jQH8dNO+DB1uPSHDDum3AgNw8Tu9Yjd1TdvqhbzCiI67tgeQf5Od+
 2/UAsm2zM2XWtj7INo4HVUZCUf227KNqDIAxxQ73jz+8KPSpMmBf1Et9ZWi3xMyaaDxJDgRGV
 BqsIjE+Ev5gjQq08pi1jDfEXhnCxPPWtxFOTHpWGv8fQgu56vFCtfcS71ybdLKrkVkkpyO0zb
 gszsXhQg3HhAx5x5QrT63gUlumOUrtK/yrWlHuA+3KOnZLckWl9CeV46sbl3/i9BfD5TkAe8q
 +OY587LaloB4077qvSD8tk0Bz6IuEaEoQqmE61YrfPi6e/biMVkWQw1fN45rMT/GdgrOkCF4w
 gW7FNVwn5aNFBg+ojAgbS8kn5184U7Vj6HzbPo2BjQcKwbIcYSRsphgYSNAE51es6qblAwWbW
 fI0LFYCttHs1ycTSkUcgYLZ9aOM1TO9Poh+p6r8lPK3lccPY0KXctIm3ivQt66gpwGD1Sw6BK
 YcjaKr8UpEyibIF0p1+YeD1as6n0+oOFgjqwKYkmAK7Qhx3VkACR1TUfEmpN9BVjoYxtIO/mh
 3HWGuSH7JAkOaU9ewJXFx8q6OlwwHfcWVA2BzzC3akAO7PmsRjy6gIUb74GzPVzXWBa0ynDpY
 Z1i0kO/b7+dlw3E7IO9Ouqus5Ia8klo3RX5kKzGcKztg9q7jGvwnwVfmqDPJLIkKVb1T86fef
 AqPnk8aFnfIWePMivSW3eM0wXpbp/gCwVSUOz3ukUN/8tTyvHX5bStj0TdMMnBo8Pv0im81ZD
 g7m3/JsoKjQAKeUYJlcFLNoAnndmqbkYOnNWZUvbSKR2uulIQSkgINWep12bP7BrIdNgecrCA
 72PSFQKgNVodAg0htxDaEMSZAxtAy2nzyewhzl/uaqQf47+aJuwm4H79YSGPL2gbWYrNylc4s
 IbYL5g==
X-Mailman-Approved-At: Tue, 24 Oct 2023 11:05:54 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jeff Johnson <quic_jjohnson@quicinc.com>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Stanislaw Gruszka <stf_xl@wp.pl>, linux-staging@lists.linux.dev, Linux Wireless <ilw@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S .
 Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On 2023-10-23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These two drivers were used for the earliest "Centrino" branded Intel
> laptops during the late 32-bit Pentium-M era, roughly 2003 to 2005, whic=
h
> probably makes it the most modern platform that still uses the wireless
> extension interface instead of cfg80211. Unlike the other drivers that
> are suggested for removal, this one is still officially maintained.
>
> According to Johannes Berg, there was an effort to finish the move away
> from wext in the past, but the last evidence of this that I could find
> is from commit a3caa99e6c68f ("libipw: initiate cfg80211 API conversion
> (v2)") in 2009.
>
> Link: https://lore.kernel.org/all/87fs2fgals.fsf@kernel.org/
> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
> Cc: Linux Wireless <ilw@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm not convinced this should be in the same set of drivers as the
> rest, since this is clearly less obsolete than the other hardware
> that I would remove support for.

These have indeed been very common back in the day, I'm still using
a 2003-vintage 1.5 GHz Pentium-M 'Banias' Acer Travelmate 292LMi
notebook using ipw2200 (and have two spare ipw2200 mini-PCI cards).
Works still fine using v6.5.8-rc1 and WPA2PSK/ CCMP (sadly it does
not do WPA3) and I do use it semi-regularly (running the latest
stable- or stable-rc kernel of the day).

While it would be nice to replace it with an ath5k based card (to
get WPA3 support), the card isn't that easy to reach in the notebook,
so it would be sad to see this go.

Host/Kernel/OS  "acer-292lmi" running Linux 6.5.8-rc1 i686 [ Debian GNU/Li=
nux trixie/sid ]
System          Acer TravelMate 290
CPU Info        Intel Pentium M 1024 KB cache flags( sse2 ) clocked at [ 1=
400.000 MHz ]
Videocard       Advanced Micro Devices, [AMD/ATI] RV350/M10 / RV360/M11 [M=
obility Radeon 9600 (PRO) / 9700]  X.Org 1.23.2.1  [ 1024x768@60.00hz ]
Network cards   Realtek RTL-8100/8101L/8139 PCI Fast Ethernet Adapter, at =
port: a000
                Intel PRO/Wireless 2200BG [Calexico2] Network Connection
Processes 131 | Uptime 3:16 | Memory 125.2/493.1MB | HDD IC25N060ATMR04-0 =
Size 60GB (67%used) | GLX Renderer llvmpipe (LLVM 16.0.6, 128 bits) | GLX =
Version Yes

Yes, this is an old and slow system, but it's there, functional and
I rarely need a mobile notebook (my desktops are more current and
64 bit capable).

02:02.0 Network controller [0280]: Intel Corporation PRO/Wireless 2200BG [=
Calexico2] Network Connection [8086:4220] (rev 05)
        Subsystem: Intel Corporation WM3B2200BG Mini-PCI Card [8086:2701]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr=
- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort-=
 <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 128 (750ns min, 6000ns max)
        Interrupt: pin A routed to IRQ 10
        Region 0: Memory at d0000000 (32-bit, non-prefetchable) [size=3D4K=
]
        Capabilities: [dc] Power Management version 2
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D=
2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D1 PME-
        Kernel driver in use: ipw2200
        Kernel modules: ipw2200

[    0.000000] Linux version 6.5.8-rc1 (s.l-h@gmx.de) (gcc-13 (Debian 13.2=
.0-5) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41) #1 SMP PREEMPT_DYNAMI=
C 6.5-13 (2023-10-17)
...
[   23.886128] lib80211: common routines for IEEE802.11 drivers
[   23.886133] lib80211_crypt: registered algorithm 'NULL'
[   24.051575] libipw: 802.11 data/management/control stack, git-1.1.13
[   24.051586] libipw: Copyright (C) 2004-2005 Intel Corporation <jketreno=
@linux.intel.com>
...
[   24.735203] ipw2200: Intel(R) PRO/Wireless 2200/2915 Network Driver, 1.=
2.2kmprq
[   24.735221] ipw2200: Copyright(c) 2003-2006 Intel Corporation
[   24.735825] ipw2200: Detected Intel PRO/Wireless 2200BG Network Connect=
ion
...
[   25.007359] ipw2200: Detected geography ZZE (13 802.11bg channels, 19 8=
02.11a channels)
...
[   27.027578] ipw2200 0000:02:02.0 wlp2s2: renamed from eth0
...
[   29.571384] NET: Registered PF_PACKET protocol family
...
[   42.603676] warning: `wpa_supplicant' uses wireless extensions which wi=
ll stop working for Wi-Fi 7 hardware; use nl80211
[   44.196736] lib80211_crypt: registered algorithm 'CCMP'

# iwconfig wlp2s2
wlp2s2    IEEE 802.11  ESSID:"xxx"
          Mode:Managed  Frequency:2.412 GHz  Access Point: xx:xx:xx:xx:xx:=
xx
          Bit Rate:54 Mb/s   Tx-Power=3D20 dBm   Sensitivity=3D8/0
          Retry limit:7   RTS thr:off   Fragment thr:off
          Encryption key:xxxx-xxxx-xxxx-xxxx-xxxx-xxxx-xxxx-xxxx   Securit=
y mode:open
          Power Management:off
          Link Quality=3D0/100  Signal level=3D-28 dBm  Noise level=3D-89 =
dBm
          Rx invalid nwid:0  Rx invalid crypt:6  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:100

# wpa_cli status
Selected interface 'wlp2s2'
bssid=3Dxx:xx:xx:xx:xx:xx
freq=3D0
ssid=3Dxxx
id=3D1
id_str=3Dxxx
mode=3Dstation
pairwise_cipher=3DCCMP
group_cipher=3DCCMP
key_mgmt=3DWPA2-PSK
wpa_state=3DCOMPLETED
ip_address=3D172.22.2.1
address=3Dxx:xx:xx:xx:xx:xx
uuid=3Dxxx

(performance against a wifi6 (ipq8071a AP isn't that great, but it works)

$ iperf3 -c 172.21.4.1
Connecting to host 172.21.4.1, port 5201
[  5] local 172.22.2.1 port 45288 connected to 172.21.4.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  1.97 MBytes  16.6 Mbits/sec    0    110 KBytes
[  5]   1.00-2.00   sec  1.74 MBytes  14.6 Mbits/sec    0    163 KBytes
[  5]   2.00-3.00   sec  1.68 MBytes  14.1 Mbits/sec    0    163 KBytes
[  5]   3.00-4.00   sec  1.68 MBytes  14.1 Mbits/sec    0    163 KBytes
[  5]   4.00-5.00   sec  1.86 MBytes  15.6 Mbits/sec    0    163 KBytes
[  5]   5.00-6.00   sec  1.49 MBytes  12.5 Mbits/sec    0    163 KBytes
[  5]   6.00-7.00   sec  1.86 MBytes  15.6 Mbits/sec    0    163 KBytes
[  5]   7.00-8.00   sec  1.93 MBytes  16.2 Mbits/sec    0    228 KBytes
[  5]   8.00-9.00   sec  1.49 MBytes  12.5 Mbits/sec    0    228 KBytes
[  5]   9.00-10.00  sec  1.99 MBytes  16.7 Mbits/sec    0    228 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  17.7 MBytes  14.8 Mbits/sec    0             send=
er
[  5]   0.00-10.13  sec  17.2 MBytes  14.3 Mbits/sec                  rece=
iver

iperf Done.

$ iperf3 -c 172.21.4.1 --reverse
Connecting to host 172.21.4.1, port 5201
Reverse mode, remote host 172.21.4.1 is sending
[  5] local 172.22.2.1 port 52246 connected to 172.21.4.1 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.04   sec  1.88 MBytes  15.1 Mbits/sec
[  5]   1.04-2.04   sec  1.75 MBytes  14.8 Mbits/sec
[  5]   2.04-3.03   sec  1.62 MBytes  13.7 Mbits/sec
[  5]   3.03-4.05   sec  1.75 MBytes  14.5 Mbits/sec
[  5]   4.05-5.03   sec  1.75 MBytes  14.9 Mbits/sec
[  5]   5.03-6.06   sec  1.88 MBytes  15.3 Mbits/sec
[  5]   6.06-7.05   sec  1.75 MBytes  14.8 Mbits/sec
[  5]   7.05-8.01   sec  1.75 MBytes  15.3 Mbits/sec
[  5]   8.01-9.03   sec  1.88 MBytes  15.4 Mbits/sec
[  5]   9.03-10.02  sec  1.75 MBytes  14.8 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.46  sec  21.4 MBytes  17.1 Mbits/sec    0             send=
er
[  5]   0.00-10.02  sec  17.8 MBytes  14.9 Mbits/sec                  rece=
iver

iperf Done.

While I'll cope if ipw2200 goes away (giving me the impetus to replace
the ipw2200 card with ath5k - or at least to use an ar5212/ar2414 ath5k
or bcm4306/2 b43 32 bit PCMCIA/ cardbus card (inconvenient, with the
antenna sticking out) until then), these have been so ubiquitous in
their days that there will be quite a few surviving specimens around
(and this one is actually still in semi-regular use with current
kernels/ userland, not daily, but 2-3+ times a month, mostly for
isolated firstboot configuration of various networking gear).

Regards
	Stefan Lippers-Hollmann
