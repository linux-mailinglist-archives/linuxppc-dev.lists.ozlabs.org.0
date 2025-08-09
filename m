Return-Path: <linuxppc-dev+bounces-10776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E95B1F491
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Aug 2025 14:33:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bzgLF60yFz3cYb;
	Sat,  9 Aug 2025 22:33:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.6.129.125
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754718835;
	cv=none; b=XyKHOByEJBdHfrtWQB5YQzEqx3q0z38K+98KgmNV5Sp4SbcWjwTjWrfDs0E9O93uBmNECOtx6FdmgeJ7y5H7AgL8N2GBX1rclsqUgJOWWE8cmyGei34YV4CI9cD1Kec8x47Y0zg3fatwNnQpNaztYh34RDOfVWCOClWIJMbPnZ3uoD+C9iNno0+NO7+2Ts2ol1LtQ0B1TKsyjSiXiQSxorFksgOl3o2jl6VD92taoU6Mz51hsCRzQCQIB1UVMspsNId9JBnm+1RQltIBguOvRzbahVBmxJMCTB/fNpjNWn3mFNFEFDla0JORuB1X6ctb12CozPHIGDM/3Iijl7JbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754718835; c=relaxed/relaxed;
	bh=JfI2h9lqm8rkHs20h3EmDX/On5NLbq3Nk1Yt1E/4aZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaDbdhRT2OaIsQMRqQZLrdor+fSWFQHAqjLuXH5JHTvl6Mt7SVmEB82qnOvFLNo/Grov4PGQ/Dwl1LFFPjuhKgBrv0rWlH2Q1KV90LZjZVTztgKqGYtSanKvre9hMpK/Qdh34QCOv87r5qMYI+gqDy6nfb0iGXor3fDMbG8bwjwtSdFCU4Vm18r9DDopa6+qyhSDI+n1PXre46ZgXrmHP4gkznnEgvTLHYO8rsx+LsJ5yLfsf7GIV80adLZWxhDz++ZJ9r/qh17qRDkhnvD6Rf7X1j0uRjYPvJlXsKUm8jZBIHHJIW5cW/BfBcAZsfiW4Sji52bdjw+Y+H16FvJkXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com.au; dkim=pass (2048-bit key; unprotected) header.d=yahoo.com.au header.i=@yahoo.com.au header.a=rsa-sha256 header.s=s2048 header.b=ehSUzmEq; dkim-atps=neutral; spf=pass (client-ip=74.6.129.125; helo=sonic309-15.consmr.mail.bf2.yahoo.com; envelope-from=hypexed@yahoo.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=yahoo.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com.au header.i=@yahoo.com.au header.a=rsa-sha256 header.s=s2048 header.b=ehSUzmEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com.au (client-ip=74.6.129.125; helo=sonic309-15.consmr.mail.bf2.yahoo.com; envelope-from=hypexed@yahoo.com.au; receiver=lists.ozlabs.org)
Received: from sonic309-15.consmr.mail.bf2.yahoo.com (sonic309-15.consmr.mail.bf2.yahoo.com [74.6.129.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bzVSw4H4bz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 15:53:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s2048; t=1754718828; bh=JfI2h9lqm8rkHs20h3EmDX/On5NLbq3Nk1Yt1E/4aZc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ehSUzmEqCVJwnLo0u23cBqM1AI9md67x8gSg/qc7f5lZPhkusYi65fI0bwoyo12w7rao71e0U0hNEJCoJxkTvYH/j7Ukc2YmbzQ9RIKeLii9YiBOb6UWA95xgR5zwI/TYygNghBmXd5yWryTXJa2eNaHt4hA5mvop2vZX3waSEOcGL76e9j7oEWzYEbetjkasTEFuPUKArKCF9VBoiWeAwsr0ap7d4DAN/RNILDdQP2dPjOjXQSowRXJbvikGYQe1gUydnb6ZCCAO+E334UBTCx7E0Fr7gUoSLwniefHyD05X9VBOwGRJtTS6lBFWguzYgMlS5Y8Sh65hPkTsG6yvA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754718828; bh=rZaTEHO5BHp9sATZxIUV1pNTfXPyk90RcKLJK+APZqz=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=dH15756p6TxWJci1OFhnSpyGqZ+lxTVmsmycGMEfDj5IR2Nq/xb0mKXfhdmOFHkl/y93LenXlptAP4kNuGBnmNlSmjurgdAc9TahYqhIq9TF/uaVb4H6JXQNAxGxJ3N6AFYIXSo16Aq9xXqDHvesHRZXLOFnHtgfPwRLMdAX60XWkITXppfrX2wzoxHOvQY+7hbfgGLK8QW9NhzTgyoYygk74AIUAOr8Zd0sSYH0OIP36MVjDCzHvvULDPFwBz5jB/JonW8moI5nXuVit6J9aXrr4TnNeAEqOF0hXIzA6w4G6pRh9BaUo1dFmJTtLjUOgS9c5Wpp39b95UrN+4p6eQ==
X-YMail-OSG: 133YHlYVM1l0xjf3Jsw2H88x1o4fUyyD9MiYGuDi1e6ECLnEZkWammttJ7auS59
 liDtr01.i8tqO8ediBr5Cdklcz8H7UZCiNlMngECD7sjVvVV6jqwGCJ96_q3OpXXjGxkde13WxGd
 4dhfBBvgQoWe_cwokShBlJCF4haOIoEpK7v5.rrsIabWFz3PixHWdGoWjoZl_U_V74DDIFEtaeDS
 P_6N3QWF9BwfJkHA0kzVk6LWXNgN7dR9ZRSHZ7mpexRPt6A0NIKdnYFR3EHUY4Xirhx11Pk8wAIp
 cgmhk36KpU8RgDkaLkdzIX0BnCXW5o1_ZMgpl_d3ienf45SkxjZvzkX1cGU_R5Y10hv9qHsULm5z
 78bEozTS7yAzkNlyBowzaH1tFA1ZYY600dcn1L1fHvIIH3OddnxBNrzyhUWX381vu7s70bWeMXmN
 ATFJW4sIfw6rroAs6FH2TjB5TgZ6YufSeGYmfOMKZ.yfp7VOY5EvaSNzS2qvxHipVlC1J8bF8r5I
 8Co06W01UG32xgluZJxjy.FoHvVOYg0isjmpLfdG156Vg4nGQ0mWhg1w9E9skUJGGvfpDWvu4w.s
 V20cqIKRI8Sw9BLpTwi8Z.FWJuZCJm.IFPimiaD0SHrQq2gGscO2VEVpJ1l.vZhcAef_mPywlPvM
 JwOtyD7457LYh9COKpGfmUbB2IwusbmPP063WerMxB5MkgEQT626TNIutfxLcKfcpF5zOhU46D2M
 Q0KBv3.CtrG1kFTYCqa.D_uGKC14LHw.irWJe_Y6H2FvjBxypsCIt7l_13qXzlHKku5zx_7oz1Ij
 M6Fxz2D85m7hwQ3xqWnhEBGAuAm52ajVLp9doQPWZt1YoLhw7wIEocmoONXN4DG6UKbIy7WzXHRL
 FDRL1izqGJSxH71SMLB1Tn5RPZMGrK2kdJaiO.GIbk3LMhtR5QOKQ5cEmHFVydoQVEF.sOQu9MAe
 bvI9mvfGSZFdZnh7RrWwsPfCXekp_rdB8n03YCtg_D8jY7mgDiuAfvdJXlg1FS95ObVZF4Thrko9
 f.wuCllGQHkWX.44DRlvB32d8HjCTIYcPRkeQqzgi3KcXXjldi1gdqs9kdaOkmxC48G_uSkKc690
 _LOQT.3J3h3LL.axSPbYXe8CW1RUOfZ40U8wqY26UnncLGMe8Zs2vRV7tX9SlYTeMfphoKgkGevL
 FTh6NHfZGIGct41RYREAXduloa0oEtAlB7Rxxi5BVLyENfUxrdKFs2l1tm8lPDRjvzl7kSeNwpLP
 tOfQi04qgsm7zOSzkKgJVc9aZzvklZ.H7shJ4BTafzmDt_04gUPD.nZBYSjricE7aCY07Kn8fYMa
 09gIHOKVOUKr.3G5JhSqc5PPtl5FxIN4eKj0nv3qcRIsR.U3VNIhsgP3.SfWOwYJTmDUfcn.RLPD
 huHWnXLRI73K2ld4eH5.R.DQWqW7813z4.8R6cfG7QaD09h3G6ucPTUakD31evgCtQCI3jm1IP02
 He8cU7HUrvp3uS7vxtxGi.mjaN5mdnqRFSz0lEUkXGTaRZvPworF3znPl8QLEBcIhJasnd_OrbNZ
 t4Txd2_NqVbUdmmeEQjvufa7tIFzW2khIFQY.a38TE1C8ClGRfxHxptXt2hgy.nTuI1hkuK7TILH
 KFV7MyrIr4PRDghj9mYKsQykCeei6H1GMntCJ83bSXY8x70N.21y6_gyh2qv3y4d5Ym.n3FCrdx7
 vdQ9l4OVXo_e6vrYsCNi8lQY30rJ9ofB3swUU4n5rCEVfLjelcZPxiPEs4.zjzNU0zEXdL8flK0W
 JldWi9Tl_w.Y_E4D_J0rVI9K1okoqzyMzgOCb1rmVkuPu02ENZ2Fl_7QLGC6lakbd.HxXo6bJdpo
 srVPXBVAP0FBESXGnfus_3mK39tHQC1JvF1Oj.LtZpCBxtYvebQ_Bmjcq9w_CeRBNAfH4eODc2rz
 3lohLGDAtNQN5nymlM74F9XH57APkNnCo_PtI_TFi8y77AxfzFcVrRQDBZQtqiKywrCLasXEAPUA
 mGICEzAcewjPqVMTMcAheKRI6rhovt1mOySaKNJ8yYFwbzASBBRbRhBG709yKgrIALW725LYf9Jl
 0VdqeIdTZvG4Cv5fb22eVsziQ5MCsytNhj_2jrnkDoalFYr5EPEbfx5Nfp70Fv.FhWJOBSEFBhav
 HRJ3eTt._PIE4WmyZKxA06wPrRPyK57uIFtr.YtEkQYUklb.KhLHYwSnFyvWG1oTjQ7aFgaaHkN9
 KJBtUsuURXSA2JBv3OCZUeDnvQO60PovO89KOh2DHull.8JwzxAEWBGb7o84mI3F9I2LL5hAHegZ
 FRrjmLYuHILaEh5mgsBpwMv7F
X-Sonic-MF: <hypexed@yahoo.com.au>
X-Sonic-ID: 7548a160-9315-4ae6-812b-d94c9ff24bdd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Sat, 9 Aug 2025 05:53:48 +0000
Received: by hermes--production-gq1-74d64bb7d7-lwch7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e96f6ae1e1972342cf65b1849a2d4637;
          Sat, 09 Aug 2025 05:53:44 +0000 (UTC)
Message-ID: <ab59a5ec-4263-4d73-bb20-5752c65af50f@yahoo.com.au>
Date: Sat, 9 Aug 2025 15:53:37 +1000
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
User-Agent: Mozilla Thunderbird
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
 <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
 <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de>
 <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
 <CADnq5_OpJdbc4YKtV-9+5JyeKyqd4+irhT6OtFq_K9KJF24VSQ@mail.gmail.com>
 <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
 <4bab7915-9739-4aea-be67-5ea122de1f5c@yahoo.com.au>
 <0ea5105b-f96f-4330-a82b-c0c1f35f7b38@xenosoft.de>
Content-Language: en-US
From: Damien Stewart <hypexed@yahoo.com.au>
In-Reply-To: <0ea5105b-f96f-4330-a82b-c0c1f35f7b38@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24260 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/8/25 5:38 am, Christian Zigotzky wrote:
> Hi Damien,
>
> Never mind. There is a patch [1]. The issue is solved. (Thanks to Alex)
>
> Cheers,
> Christian
>
> [1] 
> https://github.com/chzigotzky/kernels/blob/main/patches/v2-3-3-drm-radeon-Pass-along-the-format-info-from-.fb_create-to-drm_helper_mode_fill_fb_struct.diff

Okay that's good. Patch looks simple given the trouble this issue 
caused. I actually found the email on the forums when following the 
links and noticed an at me. I do obviously receive the emails. But don't 
always read them all and tend to check the forum for updates.


-- 
My regards,

Damien Stewart.


