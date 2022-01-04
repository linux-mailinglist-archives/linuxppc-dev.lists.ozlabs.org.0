Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BB483A67
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 03:01:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSbSC5qDBz3bhd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 13:00:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=thevertigo.com header.i=@thevertigo.com header.a=rsa-sha1 header.s=thevertigo.com header.b=eBLnf1Yu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=thevertigo.com (client-ip=23.83.209.150;
 helo=purple.birch.relay.mailchannels.net; envelope-from=kip@thevertigo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=thevertigo.com header.i=@thevertigo.com
 header.a=rsa-sha1 header.s=thevertigo.com header.b=eBLnf1Yu; 
 dkim-atps=neutral
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSbRS5m1Lz2xDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jan 2022 13:00:19 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id BBF412812B4;
 Tue,  4 Jan 2022 02:00:14 +0000 (UTC)
Received: from pdx1-sub0-mail-a311.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 2F306281444;
 Tue,  4 Jan 2022 02:00:14 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from pdx1-sub0-mail-a311.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.65.167 (trex/6.4.3); Tue, 04 Jan 2022 02:00:14 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kip@thevertigo.com
X-MailChannels-Auth-Id: dreamhost
X-Glossy-Desert: 2ff192cb24fdbcc1_1641261614522_3738638676
X-MC-Loop-Signature: 1641261614522:50312158
X-MC-Ingress-Time: 1641261614522
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a311.dreamhost.com (Postfix) with ESMTPSA id 4JSbRK3w23z3V; 
 Mon,  3 Jan 2022 18:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1641261614; bh=6O1zmbJzzvtJdbCw89MB06sSSLE=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=eBLnf1YudqGQJB92emL+dpaVLwcKr2GM2R9H5wt7m3QnKjKevBmVk8OBc4j/6aQB5
 5LkYbGiGCjRNVrvKCSC+mN8Sq/oOdHHs/0g38kvSbfx790mLW01pWgQNAhVWlVSMwC
 rwZFejkVm/V2Tzx5YuE7Edw5whrHuJL6531Riobs=
Message-ID: <ab1cf0bfad75e06ee2a56ebcf435a977f463b2d6.camel@thevertigo.com>
Subject: ppc64el kernel bug?
From: Kip Warner <kip@thevertigo.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Mon, 03 Jan 2022 18:00:11 -0800
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-cpuetS3OqBGMZgAp//3c"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-cpuetS3OqBGMZgAp//3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear List,

I was directed to this list by a colleague of mine at IBM (cc'd).

After recently spending all day debugging late into the evening, I
think I've found a problem. I noticed some really weird behaviour with
one of my application's database i/o threads exiting without any
exceptions being thrown and without anything in my code apparently
telling it to exit. This happened only on ppc64el.

I checked the postgresql log and this is what I see after my
application's connection thread bails:

   2021-12-25 06:52:52.836 UTC [144517] LOG:  server process (PID 144937) w=
as terminated by signal 11: Segmentation fault
   2021-12-25 06:52:52.836 UTC [144517] DETAIL:  Failed process was running=
: SELECT * FROM mytable;
   2021-12-25 06:52:52.836 UTC [144517] LOG:  terminating any other active =
server processes
   2021-12-25 06:52:52.836 UTC [144941] WARNING:  terminating connection be=
cause of crash of another server process
   2021-12-25 06:52:52.836 UTC [144941] DETAIL:  The postmaster has command=
ed this server process to roll back the current transaction and exit, becau=
se another server process exited abnormally and possibly corrupted shared m=
emory.
   2021-12-25 06:52:52.836 UTC [144941] HINT:  In a moment you should be ab=
le to reconnect to the database and repeat your command.
   2021-12-25 06:52:52.836 UTC [144940] WARNING:  terminating connection be=
cause of crash of another server process
   2021-12-25 06:52:52.836 UTC [144940] DETAIL:  The postmaster has command=
ed this server process to roll back the current transaction and exit, becau=
se another server process exited abnormally and possibly corrupted shared m=
emory.
   2021-12-25 06:52:52.836 UTC [144940] HINT:  In a moment you should be ab=
le to reconnect to the database and repeat your command.
   2021-12-25 06:52:52.836 UTC [144938] WARNING:  terminating connection be=
cause of crash of another server process
   2021-12-25 06:52:52.836 UTC [144938] DETAIL:  The postmaster has command=
ed this server process to roll back the current transaction and exit, becau=
se another server process exited abnormally and possibly corrupted shared m=
emory.
   2021-12-25 06:52:52.836 UTC [144938] HINT:  In a moment you should be ab=
le to reconnect to the database and repeat your command.
   2021-12-25 06:52:52.836 UTC [144939] WARNING:  terminating connection be=
cause of crash of another server process
   2021-12-25 06:52:52.836 UTC [144939] DETAIL:  The postmaster has command=
ed this server process to roll back the current transaction and exit, becau=
se another server process exited abnormally and possibly corrupted shared m=
emory.
   2021-12-25 06:52:52.836 UTC [144939] HINT:  In a moment you should be ab=
le to reconnect to the database and repeat your command.
   2021-12-25 06:52:52.836 UTC [144833] WARNING:  terminating connection be=
cause of crash of another server process
   2021-12-25 06:52:52.836 UTC [144833] DETAIL:  The postmaster has command=
ed this server process to roll back the current transaction and exit, becau=
se another server process exited abnormally and possibly corrupted shared m=
emory.
   2021-12-25 06:52:52.836 UTC [144833] HINT:  In a moment you should be ab=
le to reconnect to the database and repeat your command.
   2021-12-25 06:52:52.838 UTC [144517] LOG:  all server processes terminat=
ed; reinitializing
   2021-12-25 06:52:52.842 UTC [144942] LOG:  database system was interrupt=
ed; last known up at 2021-12-25 06:46:54 UTC
   2021-12-25 06:52:52.842 UTC [144942] LOG:  database system was not prope=
rly shut down; automatic recovery in progress
   2021-12-25 06:52:52.843 UTC [144942] LOG:  redo starts at 0/192A690
   2021-12-25 06:52:52.843 UTC [144942] LOG:  invalid record length at 0/19=
378B8: wanted 24, got 0
   2021-12-25 06:52:52.843 UTC [144942] LOG:  redo done at 0/1937430
   2021-12-25 06:52:52.850 UTC [144517] LOG:  database system is ready to a=
ccept connections

That looks like PostgreSQL itself crashed. So I started trying to find
a core dump, but couldn't find it. I checked the kernel log and this is
where it gets interesting:

   Dec 25 06:52:52 romulus-server kernel: [28835.277591] BUG: Unable to han=
dle kernel data access on write at 0x132b47d38499fd58
   Dec 25 06:52:52 romulus-server kernel: [28835.277624] Faulting instructi=
on address: 0xc0000000004d0434
   Dec 25 06:52:52 romulus-server kernel: [28835.277636] Oops: Kernel acces=
s of bad area, sig: 11 [#150]
   Dec 25 06:52:52 romulus-server kernel: [28835.277656] LE PAGE_SIZE=3D64K=
 MMU=3DRadix SMP NR_CPUS=3D2048 NUMA PowerNV
   Dec 25 06:52:52 romulus-server kernel: [28835.277669] Modules linked in:=
 veth nft_masq zfs(PO) zunicode(PO) zzstd(O) zlua(O) zcommon(PO) znvpair(PO=
) zavl(PO) icp(PO) spl(O) vhost_vsock vmw_vsock_virtio_transport_common vho=
st vhost_iotlb vsock xt_CHECKSUM nft_chain_nat xt_MASQUERADE nf_nat nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 nft_counter xt_tcpudp nft_compat bridge=
 stp llc nf_tables nfnetlink binfmt_misc dm_multipath scsi_dh_rdac scsi_dh_=
emc scsi_dh_alua joydev input_leds ipmi_powernv mac_hid ipmi_devintf ipmi_m=
sghandler ofpart cmdlinepart at24 powernv_flash mtd uio_pdrv_genirq opal_pr=
d uio ibmpowernv vmx_crypto sch_fq_codel jc42 ip_tables x_tables autofs4 xf=
s btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy async=
_pq async_xor async_tx xor hid_generic usbhid hid raid6_pq libcrc32c raid1 =
raid0 multipath linear nouveau ses enclosure scsi_transport_sas ast drm_vra=
m_helper i2c_algo_bit drm_ttm_helper ttm drm_kms_helper syscopyarea sysfill=
rect sysimgblt fb_sys_fops cec rc_core drm crct10dif_vpmsum
   Dec 25 06:52:52 romulus-server kernel: [28835.277776]  crc32c_vpmsum xhc=
i_pci tg3 aacraid xhci_pci_renesas drm_panel_orientation_quirks
   Dec 25 06:52:52 romulus-server kernel: [28835.277918] CPU: 26 PID: 14493=
7 Comm: postgres Tainted: P      D    O      5.11.0-41-generic #45-Ubuntu
   Dec 25 06:52:52 romulus-server kernel: [28835.277943] NIP: c0000000004d0=
434 LR: c0000000004d032c CTR: c0000000010a90e0
   Dec 25 06:52:52 romulus-server kernel: [28835.277975] REGS: c000000056b9=
f6b0 TRAP: 0380   Tainted: P      D    O       (5.11.0-41-generic)
   Dec 25 06:52:52 romulus-server kernel: [28835.278008] MSR: 9000000000009=
033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 88002281  XER: 0000008c
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] CFAR: c0000000004d=
041c IRQMASK: 0=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR00: c0000000004=
d032c c000000056b9f950 c000000002409a00 0000000000000000=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR04: 00000000004=
00cc0 0000000000000097 ffffffffffffffff c000000ffda9d0d0=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR08: 0000000ffbd=
90000 132b47d38499fce8 0000000000000070 d4ff277338704e25=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR12: 00000000000=
02000 c000000ffffd2c00 0000000000000000 c000000116c512d0=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR16: 00000000000=
00154 c000000116c51570 c000000056b9fc88 0000000000000154=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR20: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR24: c000000000e=
cccc0 0000000000000001 c0000000024588fc c000000000ec9954=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR28: fffffffffff=
fffff c00000001d597e40 0000000000400cc0 c000000003018880=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278213] NIP [c0000000004d0=
434] kmem_cache_alloc_node+0x1d4/0x490
   Dec 25 06:52:52 romulus-server kernel: [28835.278237] LR [c0000000004d03=
2c] kmem_cache_alloc_node+0xcc/0x490
   Dec 25 06:52:52 romulus-server kernel: [28835.278268] Call Trace:
   Dec 25 06:52:52 romulus-server kernel: [28835.278283] [c000000056b9f950]=
 [c0000000004d032c] kmem_cache_alloc_node+0xcc/0x490 (unreliable)
   Dec 25 06:52:52 romulus-server kernel: [28835.278328] [c000000056b9f9c0]=
 [c000000000ec9954] __alloc_skb+0x74/0x2d0
   Dec 25 06:52:52 romulus-server kernel: [28835.278369] [c000000056b9fa20]=
 [c000000000ecccc0] alloc_skb_with_frags+0x70/0x2e0
   Dec 25 06:52:52 romulus-server kernel: [28835.278403] [c000000056b9faa0]=
 [c000000000ec0f38] sock_alloc_send_pskb+0x1d8/0x200
   Dec 25 06:52:52 romulus-server kernel: [28835.278436] [c000000056b9fb10]=
 [c0000000010a93a8] unix_stream_sendmsg+0x2c8/0x710
   Dec 25 06:52:52 romulus-server kernel: [28835.278471] [c000000056b9fc10]=
 [c000000000eb64e0] sock_sendmsg+0x80/0xb0
   Dec 25 06:52:52 romulus-server kernel: [28835.278494] [c000000056b9fc40]=
 [c000000000ebab88] __sys_sendto+0xf8/0x1a0
   Dec 25 06:52:52 romulus-server kernel: [28835.278526] [c000000056b9fd90]=
 [c000000000ebaca0] sys_send+0x30/0x40
   Dec 25 06:52:52 romulus-server kernel: [28835.278558] [c000000056b9fdb0]=
 [c000000000036ffc] system_call_exception+0x10c/0x230
   Dec 25 06:52:52 romulus-server kernel: [28835.278601] [c000000056b9fe10]=
 [c00000000000d374] system_call_vectored_common+0xf4/0x26c
   Dec 25 06:52:52 romulus-server kernel: [28835.278634] --- interrupt: 300=
0 at 0x7ec638a194f4
   Dec 25 06:52:52 romulus-server kernel: [28835.278654] NIP: 00007ec638a19=
4f4 LR: 0000000000000000 CTR: 0000000000000000
   Dec 25 06:52:52 romulus-server kernel: [28835.278685] REGS: c000000056b9=
fe80 TRAP: 3000   Tainted: P      D    O       (5.11.0-41-generic)
   Dec 25 06:52:52 romulus-server kernel: [28835.278719] MSR: 900000000280f=
033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48008281 XER: 00000000
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] IRQMASK: 0=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR00: 00000000000=
0014e 00007fffe99c1800 00007ec638a47f00 0000000000000009=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR04: 00000043809=
d1148 0000000000000154 0000000000000000 0000000000001ae8=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR08: 00000043623=
47d00 0000000000000000 0000000000000000 0000000000000000=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR12: 00000000000=
00000 00007ec6348e0890 0000000000000000 ffffffffffffffff=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR16: 00000000000=
00000 000000436233f7a0 0000000000000001 0000000000000000=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR20: 00007fffe99=
c18ac 0000004362344f48 0000000000000004 00007fffe99c18b0=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR24: 00000000060=
00001 0000000000000000 0000000000000154 00000043809d1148=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR28: 00000000000=
00000 00007ec6348d9938 00000043809ceb00 000000000000000b=20
   Dec 25 06:52:52 romulus-server kernel: [28835.278992] NIP [00007ec638a19=
4f4] 0x7ec638a194f4
   Dec 25 06:52:52 romulus-server kernel: [28835.279020] LR [00000000000000=
00] 0x0
   Dec 25 06:52:52 romulus-server kernel: [28835.279038] --- interrupt: 300=
0
   Dec 25 06:52:52 romulus-server kernel: [28835.279054] Instruction dump:
   Dec 25 06:52:52 romulus-server kernel: [28835.279072] f9210020 41820098 =
2e1cffff 3b200001 2c2a0000 41820088 41920010 894a0007=20
   Dec 25 06:52:52 romulus-server kernel: [28835.279110] 7c1c5000 40820078 =
815f0028 e97f00b8 <7ce9502a> 7c095214 886d0988 9b2d0988=20
   Dec 25 06:52:52 romulus-server kernel: [28835.279141] ---[ end trace fe7=
ee98d0b7beb6a ]---
   Dec 25 06:52:52 romulus-server kernel: [28835.855026]=20

I'm only experiencing this on ppc64el, but not amd64 or risc64. The
closest thing I could find to it was this:

=C2=A0=C2=A0 https://github.com/dynup/kpatch/issues/1228

I'm using kernel 5.11.0-41-generic and g++ 11.1.0.

Any thoughts?

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-cpuetS3OqBGMZgAp//3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmHTqisACgkQRLRlxF7U
4wSRGhAAglWDAk6y+fkDP7gVEan+8NjSzXEFCORgjOUWyItfRS+ntm20Sm8t7UoW
/DvQRVi69LkQ3U/89n8IJUxkGiusYeB70UiZu2kneIAVc5ce2NIzgJSyFbI4KztD
DJSNiI1wXS/fHizjMTIIYtIacLqPQm6Vl5jKykBIsPZyK67ZRJ+jn5q1FlrGmxoz
9dTta+vRU9qfxjDywHjmg9or45mYgIP4nVQGyitz8o/VjVFlpKwfFX5ZMhfBdWzw
pR8zpTTCXszA1fSG0NRn5ecm3yWYcZ2AxCTSd3oGRy4ii2KeZ/qRpMwwb5SksMnC
0hnGNQ9/ML3Ov2ihlbynfmlWhrDsYok+KBIW4YM4qo8dLfFmkFbfKKfXPzgYZkIo
FVyrP7VtklkXlhX1q//n8FI5zNbokJ6oHBAPcbscZa5gsNwDYS8AJd4Q+YnH5xqo
LXE5572ogwd/g2ZEtwgBtkamrhEidHSEo9f2z4JU/7KlAf54EPdZXUPEZf5s7Ocb
abdF1U87YGAmoHyWhng0eWDY/FFAyzm9AY+BENiQYyqsoOaqtE9HhbkTeXUXz8uM
pcK9L7X7ag6UQOLwjOzfdjPSFX7oTPNWHF7/MbnXqozJZy3iQFEbPq8HHpWY0f5v
XGEGAxwPrsb2+AZBxBZHODB6GcNn8VDSxb1GbR3k/K3L2NRRxq4=
=9NEg
-----END PGP SIGNATURE-----

--=-cpuetS3OqBGMZgAp//3c--

