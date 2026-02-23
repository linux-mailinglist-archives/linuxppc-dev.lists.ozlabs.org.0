Return-Path: <linuxppc-dev+bounces-17065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3SBAGFnGm7IwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 17:49:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2417A20C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 17:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKRdS2YQjz30FD;
	Tue, 24 Feb 2026 03:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771865340;
	cv=pass; b=Aa0xgx7Q/oQ2+cArAd2sZ3+QFw8TXI7J6BA3hFqBMts8eNau6vUHjcGZwLQvfNr/jsBImvS3y+BRgCMA7wpysavXkp6YQAyBqjSL5maSgb7tFzxKv0xXTgoF6bkv1w4HCcKxdwLhHB3E6a+7+Xml/xXven6lKTqOGazqN6AzoeDPxy2cG1ktB0ScInlpnHZC2N/UhGqINcvs0iJ6CzsxqhHTSOBcW6HWV6AltUfc7jCdE1afwzycgmS92XsdtAubC3/05yPGcP5wHwuisp6T2ms4rEC0bbL59iNEWO6QPUIOIyEyPWyr8bRnOJ+ijXRn9PVTtddGz9xWLSeBkUu+dA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771865340; c=relaxed/relaxed;
	bh=bKqni7nqL70PbmrNQ22jLRyX5w8Geu8U3QoATFPAlRI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=C8e+QlJvoT51nPd481bVAFNGpK3iYvYhmY8FHGEviR6Ci1s1jNx5ex93NK3ar+qKwrWKzGiF5tOhkpMGaNMC09VSYHlXLODXlTifL6EfTbVKNezZty3c/3a46GcptOTw1BtTMAeaDaszIUf7OVjICDUhWvf3Ie6UYimRkYorg/f+oxQMF2Cu6lJ7VXCA2rh/FeuiMgGfu09TH12OhJS5XWxsTkCw6phqyz2dNZ4CyQT8s6FfD84W91EC9qOFBDfEbtqM7JgiRTAmKYC4xBX1GCbQGOfoIqUCG8mGqYSvgEqJEqnFKfso80MzyfiKsW2bRPmpEj4QIarFQ+7WJRDKOQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AmWePtxP; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ncnXRpy6; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AmWePtxP;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ncnXRpy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKRdN0vkwz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 03:48:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771865329; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IEWSQ0T3CVqDuqJbqavN+gh/p6dN/OWeVLc62UGqZcFNZKoWvc7IGLpatfqE0YhwQo
    B67u7yUUvLU7ssS/v1ZhCqWsMLXsuxf/xqlQqNG+kyceadVJ4wFF+CIG66Ay+t5Fs0KE
    6YC339Z7LygEpf2xzmSQEef0nj+nKrLVgMwz3CrTbfa1e4WXXmnOszyUbdVKi+2gzkno
    6sp+N6z9kP7QVSXRR5uPt/e7yG8NsCIyS9QcQjWJ8LFhKW8FmfGBjeTN0L5dPj24BLmk
    Rd+hgxPxkIflMyr9AXn2t+ZDQh0pELBkLbDZaTdO8s6ZDW2LU4eH5/X+5wqYekko4GId
    jHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771865329;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bKqni7nqL70PbmrNQ22jLRyX5w8Geu8U3QoATFPAlRI=;
    b=dmo3KaAzjPubFk3OWu7lPeU4uzlBD21zxYQOaxFk1ESDXz7+X4sBqerhz9k3cIs2J8
    uQHfQ+6MUoByR5Sc3fnF7rP4E24hYhQod6UX46A6B9dWE3wZXjwPayaJdhxmxfAJQGqa
    lmx/icSppOhm7lT6WNOaYBhvqZFB6ehV7n5TLw4kF35jytsq6p02ZxyxhMSFt+zRS0qO
    XUNlKEGVoeWHT/kG160v1AdEJC/3NDAM94z13p3Aoe0A8WFhAmEaGSVl9Y6mRqLm7onO
    /ObAtg0b+y6Ouf9c6M+yc7DzDH+P4Od0XVJGgJYcPPOKTsO/11w3/xlOJCNpr1Bw45cZ
    DQ6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771865329;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bKqni7nqL70PbmrNQ22jLRyX5w8Geu8U3QoATFPAlRI=;
    b=AmWePtxPQab5sKPfsGGfwT6ScT/2o3vpkhkzPTOTjS7PoI5jbZZ89ga8WU66MP9f0U
    2JeWUXlozp/qjPZOl27DMGvoz7Eup8yv6p/YMCcTUubB7BOwtXct3AbUB9eCk2Bqj4xB
    cs2OsRzt3MV6Vj0pykMUmeIlLDeUrNlJD2UIlVdy6KRx3Tt4No2wioVb2TgWCcqAlUQU
    eCZkKzQrdNeFFFtqIEHyXl15HEbyvblsHvq9IeUvEIf/vuG3Rf0C3D3g43VKeTCartdE
    NiK6AVCDFPgZamWx5iVkkqHrMrdb1fMRWjGVOY2+Js+pKObpqEkHgAf/q/+ldITnrxLa
    dsNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771865329;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bKqni7nqL70PbmrNQ22jLRyX5w8Geu8U3QoATFPAlRI=;
    b=ncnXRpy6siEL3bkSUJbbqQo9sWbvliWEx4bNy6LQT+sqGoSknZRPOcRupn9DFnNd98
    ogJ1iFNElNK+BoCMe7Bg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxr+EbqvLKPFZjq1oHakqGD08HdGwvF9VZzROCQ=="
Received: from [IPv6:2001:16b8:50fb:2000:42ef:a10e:d99e:5c76]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id e9337f21NGmmiOB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Feb 2026 17:48:48 +0100 (CET)
Subject: [Linux PPC] 7.0-rc1: e500_mmu.c:923:26: error: assignment to 'struct
 tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *'
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
 <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <2cbd1e19-ac99-29c3-ab89-3c58a9863e5a@xenosoft.de>
Date: Mon, 23 Feb 2026 17:48:48 +0100
X-Mailer: BrassMonkey/33.9.1
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
In-Reply-To: <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17065-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,xenosoft.de:mid,xenosoft.de:dkim]
X-Rspamd-Queue-Id: 48E2417A20C
X-Rspamd-Action: no action

Hello,

Compiling issue for e5500 machines for the RC1 of kernel 7.0:

arch/powerpc/kvm/e500_mmu.c: In function 'kvmppc_e500_tlb_init':
arch/powerpc/kvm/e500_mmu.c:923:26: error: assignment to 'struct 
tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' 
[-Werror=incompatible-pointer-types]
   923 |  vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
       |                          ^
arch/powerpc/kvm/e500_mmu.c:928:26: error: assignment to 'struct 
tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' 
[-Werror=incompatible-pointer-types]
   928 |  vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,

Temporary solution: # CONFIG_VIRTUALIZATION is not set

Please solve this issue.

Thanks,
Christian

