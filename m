Return-Path: <linuxppc-dev+bounces-16762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPboDCzcimkOOgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 08:20:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2309117DA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 08:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Cd3600Nz30FP;
	Tue, 10 Feb 2026 18:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.134.238 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770708007;
	cv=pass; b=TkEyZbHJl2CdD58gf6EuUdL2l8UFsC5dAaPh95Wk2a2mZbCr5Q85OKaPeJcijPrw/Gds4hZmkoOnHB/Ln6SoATssCqYngrMG6w6IwYTg2Od/gytWu2FUORFbZMi9gPgl0Ocha/uDHchU8A85OUGjGUNkQ5/zEbLhpp4ssYXmiQpUTU/nqLBUt2eq5hlK+Giy63LLZCGMQnP+6+rKxCbO4W9uisj0sVFMWkrE0075LjyPh3s1YI2SkOoMEGDnVui93dnSWFFcv8OMOFeMfJ3Jk/38zZHz/nfIPmBj3YQ2CDJJZbe20TugIYiTFR8kLAebzbZSGwh+8NdOqKwGDJ3wSA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770708007; c=relaxed/relaxed;
	bh=pabMGLGGXLOcOo/Dpjkxu/cClFC72VFL87C8/t2PX84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeWgTcpczNUuqxDpFqCq/nOLYfFA/vf+vWv8+LYxx/XgTGE5jFImlmSFauZg/8HQUqxUKjWAcxAT8UlLnOnq56GgCqdZRtUpJMDfKdnQ63WaVY3iT3ZcX5fPJs7vwSvr1a0BlZkGAVhwyhlHIB4N6xG1qhmFvDceYHmBU30IkE6x6cR78OkB1TMaajiqgcvAwgo9cVZKSzfA9wI2wa93o8n6YolVQJpo6MT3IT8YFxWQMeqjx0gmSYVO4G2KbjePy4IKWcm2ted0ZJoeKe6UvGSuFaXRNX4xXCWLBbZYvD08bewPRxNo6S3nmo00xWMuGhkNUHtOGLgd/r2i3S+nsg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=kr2UFQaX; dkim-atps=neutral; spf=pass (client-ip=94.100.134.238; helo=mx-relay49-hz3.antispameurope.com; envelope-from=prvs=049498f0c0=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=kr2UFQaX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.134.238; helo=mx-relay49-hz3.antispameurope.com; envelope-from=prvs=049498f0c0=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Tue, 10 Feb 2026 18:20:04 AEDT
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Cd04mZYz309N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 18:20:04 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pabMGLGGXLOcOo/Dpjkxu/cClFC72VFL87C8/t2PX84=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770707921;
 b=Lkf/ijyYtpqXJ9nBvRIQnxMT7wE3VP46AOQkAiCLWiFQuWiStceCtKu0BcQ8FpDH4Vil5gdR
 wbDJHZmH+rJwuTcs6epCVLN+1fFdRPwyHzlQeqTPnLniSD5Op0dqYaoLHi5xj688dgTIqhy8i+C
 g1vCnEBKPblmz023LUh4XcV+MVLBEn52WIhxpEuUKAVXOBatBhcEFo9x+cEo64h/qDhuTk5YX20
 IUWkFcXjhcs1+hcTE5DSRtULGZuDYm8lMzktXIvUl9HzxUq+m6t56I/YSd96wIPEWW24XY+b1bN
 /eEEbQ+PChKIUVqDYifrjLITDyili97aWsSgt/CoCEQTQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770707921;
 b=EcqE3uDndxlQFBbaKYeMbWnvs6AEVt9IXqKP3ll2yg6TwoN8DxBHDVs9VkLzGAbVS2Br37eD
 6u9zduS7uz95eQLIIuyKNF1v3bghWHmGNqLo8tm0o1eap+jDXN2MVVNxBafN5KL/wjEEDMUc2Nc
 Zi+c8WkjZ455STgIBbxN4zBp5VMud7KNKGOsK5APSqOnBqtCKIVCMERVdZSRyLot/R70ktdpNjc
 0rM+G9SA06WC5N25vgcSJ6U1Kb8pyLN8OAFy0NYMKMps0vbK3lmSclH92VRENTSljve5pnhoN4E
 Q2zUoEx6CZI7nrspaN7VTHYuIsQkxfDsxBZLv1tfGxFHw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 10 Feb 2026 08:18:40 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 59A1B5A3119;
	Tue, 10 Feb 2026 08:18:27 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Date: Tue, 10 Feb 2026 08:18:26 +0100
Message-ID: <5056506.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linuxppc-dev@lists.ozlabs.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9Cb80s0Mz3ybFB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f91bf45b2c1e1e4dad7653f0d57fe9b6
X-cloud-security:scantime:2.062
DKIM-Signature: a=rsa-sha256;
 bh=pabMGLGGXLOcOo/Dpjkxu/cClFC72VFL87C8/t2PX84=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770707920; v=1;
 b=kr2UFQaXqPIR8OnShRcChB+GiU3jo1eLV0g4IdsE34lLXNwBvrRgOpu0kOg/c9MOxcApcEuJ
 QuhMek6GiRshG3lAThzz1X6n+SKwzFtBKGYHTU2CW8F9h21Vi4fLxaVyN++RWh7ID2/QYa1DrQL
 c7MHkLvc2rifGIQiYZRWQSsWvQLWbUQuNcKVLEkMoqsTnv1k5DXIyh0VH98FkpplMLDshVmPBSt
 ntCRtzYzdAWUrbe+GOGhh7JtTlNvNyQBZm6Txnxs0vAdc+JlHvC35bPVd5NcLAE+DAi37wZPMs4
 P/KQi0Ij/i+3cWH9GE7p1i/I7R4bK0aJ75K8g7wro2Egg==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:n7l8m4@u.northwestern.edu,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,u.northwestern.edu];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16762-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,u.northwestern.edu];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B2309117DA5
X-Rspamd-Action: no action

Hi,

Am Montag, 2. Februar 2026, 18:41:12 CET schrieb Ziyi Guo:
> fsl_xcvr_activate_ctl() has=20
> lockdep_assert_held(&card->snd_card->controls_rwsem),
> but fsl_xcvr_mode_put() calls it without acquiring this lock.
>=20
> Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
> fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().
>=20
> Add the missing down_read()/up_read() calls around fsl_xcvr_activate_ctl()
> in fsl_xcvr_mode_put() to fix the lockdep assertion and prevent potential
> race conditions when multiple userspace threads access the control.
>=20
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  sound/soc/fsl/fsl_xcvr.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index a268fb81a2f8..0b9dd64b9a82 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -223,10 +223,13 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *k=
control,
> =20
>  	xcvr->mode =3D snd_soc_enum_item_to_val(e, item[0]);
> =20
> +	down_read(&card->snd_card->controls_rwsem);

This lock causes a blocked task on my TQMa8MPxL based board:

INFO: task alsactl:1969 blocked for more than 120 seconds.
      Tainted: G        W           6.19.0-next-20260209+ #3331
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:alsactl         state:D stack:0     pid:1969  tgid:1969  ppid:1      t=
ask_flags:0x400100 flags:0x00000a01
Call trace:
 __switch_to+0xdc/0x120 (T)
 __schedule+0x258/0x790
 schedule+0x30/0xb0
 schedule_preempt_disabled+0x20/0x40
 rwsem_down_read_slowpath+0x214/0x68c
 down_read+0xb0/0xb8
 fsl_xcvr_mode_put+0x4c/0xc0 [snd_soc_fsl_xcvr ac1b31380c6a6ea0d613bd5f7848=
9e314a40f91f]
 snd_ctl_elem_write+0xdc/0x180 [snd 852e63996474051c57bcd1a86ebfd8108307385=
3]
 snd_ctl_ioctl+0x7a4/0xaec [snd 852e63996474051c57bcd1a86ebfd81083073853]
 __arm64_sys_ioctl+0x9c/0xe4
 invoke_syscall.constprop.0+0x58/0xcc
 el0_svc_common.constprop.0+0xac/0xd4
 do_el0_svc+0x18/0x20
 el0_svc+0x24/0xa0
 el0t_64_sync_handler+0x98/0xdc
 el0t_64_sync+0x154/0x158
INFO: task alsactl:1969 <reader> blocked on an rw-semaphore likely owned by=
 task alsactl:1969 <writer>

Best regards,
Alexander

>  	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
>  			      (xcvr->mode =3D=3D FSL_XCVR_MODE_ARC));
>  	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
>  			      (xcvr->mode =3D=3D FSL_XCVR_MODE_EARC));
> +	up_read(&card->snd_card->controls_rwsem);
> +
>  	/* Allow playback for SPDIF only */
>  	rtd =3D snd_soc_get_pcm_runtime(card, card->dai_link);
>  	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =3D
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



