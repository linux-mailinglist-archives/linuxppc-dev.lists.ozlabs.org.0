Return-Path: <linuxppc-dev+bounces-10775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FC9B1F098
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Aug 2025 00:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bzJ5p4Z46z2xjP;
	Sat,  9 Aug 2025 08:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.6.129.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754668925;
	cv=none; b=bavccdnAqn8E9bWYg+N+p0y4jYHimz/v2/PzRzhhWWI2+PoP9LqeRWqzsceHZXom6+zmHEOmx4vFMuy1yUNUC8AjeP/a+R3xupmWF9HBTouPZagdwu5KX+q7bDL444jgYxUfysHs0ce3mWZTMBVg//tTHleX59utlMfcQW6dwHlzK5wb0ONhzPASGq82kBhYftQkCw6Klm0j6VO3se1Osx/xmg26Uz+monp5AoI/FTJMiINdpBDSvQVn3LX1rGBqzqSwxzwHnL2aIkw787qPCSFw13iPGvXvH24d4X4eRdxsP6YSbt1gsAX0KGIQp+MzOfIc7b/xXyKds/dO2yqgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754668925; c=relaxed/relaxed;
	bh=ZuO89GmtytgzWc6IU8wcFTYUedFni2KfhgSOdSCb36s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYUn3u0TFQAPaxwwl+5/NkIjYguTFHX5IfOnuru8pmyU3iHflFqoN6jLiM87k36nR7JoFLhpa/9zqICxI1UFrsUcUQbfRErbfvc8SXO5Khdo1V6ry6B6w4S2IzU7zlDwmi161M+vQj+7UVJDkz6sVfB8+FimwHiWgsGBrCK3rV24FinFGuGdgvoh5sWOREIGlPPPy9myGvjRNWi1+MdxMvdgLkCuAO7QRLmwR12qgchPW0UKSIcW4fjNI4K+HUUrHJ+HCXxIq23/wM+8o9KrJvO7g6kc3TGap0OcQ4h16tns4O9UEtylh4OovToMB2ORhtP1KWE8T7iqwrKWsy/8Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com.au; dkim=pass (2048-bit key; unprotected) header.d=yahoo.com.au header.i=@yahoo.com.au header.a=rsa-sha256 header.s=s2048 header.b=AZ/HNkrk; dkim-atps=neutral; spf=pass (client-ip=74.6.129.81; helo=sonic317-26.consmr.mail.bf2.yahoo.com; envelope-from=hypexed@yahoo.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=yahoo.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com.au header.i=@yahoo.com.au header.a=rsa-sha256 header.s=s2048 header.b=AZ/HNkrk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com.au (client-ip=74.6.129.81; helo=sonic317-26.consmr.mail.bf2.yahoo.com; envelope-from=hypexed@yahoo.com.au; receiver=lists.ozlabs.org)
Received: from sonic317-26.consmr.mail.bf2.yahoo.com (sonic317-26.consmr.mail.bf2.yahoo.com [74.6.129.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz8165MJMz2xK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 02:02:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s2048; t=1754668917; bh=ZuO89GmtytgzWc6IU8wcFTYUedFni2KfhgSOdSCb36s=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=AZ/HNkrkUDeoOj8zjlfo/vqNsIK0HLT2jzrQYh8IdVPe/PLHlNYgEXCZsz5YzFvgI/7Z+1SVHol/LHjT8LFhqOGLAiLWYm1urwOAJz3wcy/pfw8LfTLOVmClw0xcTjsy4Y08nxgPDUMbIjeHGCawGO/ui4fMf2Lb5ew8ety/H2Zfl1wKYxUw/55fx2nmeyCfPg7FsBUfTK79EyajoqsSIYKXb/71S1oWxW4B93bWE82j7xE+s3MqnsA0C4KOqnFCjbMrCEXsKnNILt7HwXZtPvFHZdDO8MKEE26Q9EFt4HmHVHuMqOFST58HHRuWC2Bc7YDQ4dThmyEGVisU4z4h6A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754668917; bh=4oQx52OL639rv6fFompwlB/B3iDXSaLB3C7B163eqX2=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=DKr80ooDmgWP8zVITJ0QTZJoejWF700NAR5r1xPBnzTw0VAkN5vGqdN6d10nFDpenBw6IsoH0LhUkzSz6Z9ADUWlCWwGtdBZNPiC4dGX6nuGuJsu/ZSrmCShNAVEUgsXIL/hz8/90LOBzxrovbEDvPk7Yri4EhHgRXAo1s6RSOPe0+eSdkumkyXN29ntqthcrBT1C/lVI/tKpSZ3gNCCRN5NWGa6tj7hC2DaZd/G489PubTCKrWIYpw9hBOZRx0w2n2vVHGo2CRR6lDUfB/vIxo4IxoMPXw599GBS24mild1xtsk9Iq4lScYhny9D6bp492uDYTuBE20qLNVCLbCGA==
X-YMail-OSG: zqeLHdcVM1kz0n.mxcHVQzjLsmaKmUjsQNBteX69ndVsdEGw5uUlYYJGsstngNi
 ryPVQx8kA.TMAHCRXocf5jNBcWyp3cD0mrRDsqNS2NXfRf0QKP5aXpvYblIKgpx5R3_1WE_aDbRc
 HFWg0NvxE25bM_oJ4xEC9n3Qq.zOq9I2sCiaAUPhCNLgu9YVpyI5.6hFzOnnqs8GpnyYLAKmBSTq
 p18NiFykZm.GfDOPbf5MbXFQR3QzRT3MiskZBaAWgoCp9DBsBH30sEA6F80eU2tVvLg1eWAnAD2t
 WjkdDMANvc2W5wF4NoNtHyBmvmvTqbTE4wsBHZeUJPOrBebqI7n0eb6efJfVowSpC0v8E9H.Kg.x
 7.AgJmiHWkj5A_SqFqct.l9Toa_9sHUgu7NMmwDp9Tqmq.PO8HICkmNGa6auKdmGPf7jihVXrcKd
 ZVQEYW6n_xLlXMEHzPJ4UcCU4AwdZ3RLDetaeU6JViWhReUaPZcIqUS4CNU2piN6gBFaJM8un56G
 LNBTbPU28KrloIMoVMLQ4K8c7.qQnBrcPLA7iGhPr5af3mpjVajmxr38D2kLSdiRoZDqekPSvH9L
 jtqxrMv03VvvvMMdtHCMcI3PmXJN6.mSWt2LylZUCVZJiAjiT65yvFIUNG_.aIHdTjMS832ca.4b
 pANbZJ.8sWnrleuNdUlWGl8nWPEh71QQZuE8VAVgUCqW1nD0KeexcL3pOzrfu.LGPtMQvIc8gxYX
 nNQDTv7QKzxOiKUAuP9fVG3QRcyaGKeilLaVyzv6_XraabSr9DsAh_mlJwenLanERW2GvufJkZuB
 hJrWlHoF24hX9JbZhGRwCDB75rvdMfYRzxVNTfSJkpFeufWPf5oJUDdA8pUN2q7eFeG_MvPwIFBb
 vWyYeFitDSwgz490pEqtVnKD3mAXD6Dx.rXuXRGAzG0MNr1lTUcAWLgZzJnyFjOQuthuqKutPB.6
 lqCSEFvWscfYE4MOEwTsYQCFdh9YTeOnkbebjfIbgQPH56g3OiE42vHytDVZtP8RxJgUFFDVfVS0
 iZTx_iu9Y9mqi0uoNYzq7gTxlnNokacm4pO40Ji_bZeyR7Qte9rGZTgCDHnEHIaAtXlhyCM6MhHC
 FWeKtadeBEUU.drT8sQypJuXZbMDALLq3R6GvFF0pf0y.N4AXQUvMWK7h7nFwrJUA823.wDWB0QA
 467nmlbmIeemjnJkXtVLsYZGK7jdAB8DRXg7w79tZdNu.2fP6SRUH_yDJPLU_2IezXLHPz3_HMft
 OG6LOBj2jgniXsvsxIuenE6UMjsrJbtpYRJGFHVC_YvqNDBm0aTGZqS941jnlW6KP.bZwAV1ule1
 xZiUsrkuayjcJYkWItAKrqJKV7LZ77P8Xs9v1Q3n9HjhK.wpR_HIU9tQ1jr5VCdW6XyJSnwJf55w
 Ucwl067lR0MAoNyte1hh8gd6EW1F.6sOejSaYm9B32eVIoxU.1GGesDoxXcFL5ud4i9ktfCVlgZT
 jpqfj69Y86_PGF9nxCCZYUNCl3Gb2c34Fjv6f.3WqQRaE40pP615W3bW2B1PE0nSW0ltbWhAXFWf
 9LrC6wr2YTthVu.qoeMPzHatHMPmvzwrx0kk.Lt5YHTSXy2Dg3.va2HtLx5XOLaJCWHQ2Em8sZx8
 lNAp2sZuSLjn5bxMsuXKThC8J0YQpzafynjmCydJK.B8_BaVaCvOS4RJFR9WcNAJerub8wBcZkdM
 9tYSnbDi_awCUK1Tlg31HBc_F7zxHWHaRtSsJihLYtUVKfSmpZk_.n_LPOv017OVpxYN6.wFjoPK
 aGXqe2T_d27GyMT_E8T.g9398slDhusyevMsEjFEOlBRE76xyAM5c2TF3teXrg9_AaSPfSrSKcJ6
 CTXDZ0QE1z3PGcP3QeSUmFd5iK5a6xSMubv6WkBrV7_3qE9jtUePAy7.0SC.Y41XiL4JjGhGGpYZ
 GN0L5P4uuD7kLA6YIiWnb5leeawJ601b4HJKjeChBIDqkcQZJneGQa_MoOL2D_a5U79_cKx4482B
 A50VTyVI8pWR5sCuv65zPkElactxl69DsLwWcz3.pLm8svRi93sjfvABmtrEufaLNbMUQrvI6sR4
 AwyzZO8siN_mbzsf3QHPXo6K6AZRtir1rWX3SxL51nnN6ndimCeRQ27CFub77T07yDoaGCMsYJxh
 uE.UxDWtlM8PR8k_6Um8Ml0q5UU5b9Cq2D2wjTCG_WViV7y0Kg2EfMnEhSZ0Xd7aO.KPh9InuQW7
 UJAAY0oHKHB_Slgv3rZAnF_H3WmTX_oDA89AJDimhL_w_PLtFiz7JB6k_6N_9ilTgkX0rtOdrnGf
 foXCtpa_znVMX
X-Sonic-MF: <hypexed@yahoo.com.au>
X-Sonic-ID: 56f3f109-12cb-4467-9d3f-5d50eb9b7caa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Fri, 8 Aug 2025 16:01:57 +0000
Received: by hermes--production-gq1-74d64bb7d7-nccgl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 10dbf4c146e19dfc3266b14fa0044a38;
          Fri, 08 Aug 2025 16:01:53 +0000 (UTC)
Message-ID: <4bab7915-9739-4aea-be67-5ea122de1f5c@yahoo.com.au>
Date: Sat, 9 Aug 2025 02:01:45 +1000
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
Content-Language: en-US
From: Damien Stewart <hypexed@yahoo.com.au>
In-Reply-To: <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24260 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/8/25 2:05 am, Christian Zigotzky wrote:
>
> @Hypex
> Could you please attach your full dmesg output? 

Hi. Sorry just found this. Do you still need a dmesg? I collected a few 
and can provide one for any broken version.


-- 
My regards,

Damien Stewart.


