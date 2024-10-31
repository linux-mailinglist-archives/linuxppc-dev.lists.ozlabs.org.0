Return-Path: <linuxppc-dev+bounces-2749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD29B80F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 18:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfVyJ0S3sz2y8Z;
	Fri,  1 Nov 2024 04:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730394967;
	cv=none; b=MDyew3nkynVtbXqOCk4yq9j66gjDE0TFUjfvPVBU3S9HWLF6GhFq81TR662Bac7Br+8dk1XSAMdxMDz+PwEa3EU663vZxdLTKYCUBJpLp1+f5PjBg2fJ0Za7czw9DwdIMSgyRbmhpiNFXXAq6O1tvKeAexawrbixcizd8UFc3PnFQgihIVu2EuWPJ2w0Jy59OMYpnpZ/N8pkBg/jEnySOyTOAGzbYp41WkUf2yF2vRlzk7O+LQdZBkLv4WRfF6EQ+K2J+vJcqrBNekqPvoulN4uIevLYyv1qYyWT6igHHlFkt4mAD5qKOCq/fqjo37fQXEjU8hqXRZSm5vWkuztuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730394967; c=relaxed/relaxed;
	bh=FthgIjAqLOLHlW+bbPCASseCj6Y1lbUXeoQ5RfEPC2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krFWfkAzawjyWtOmLqsYQLpIwpsTCmk6f5eRcsNTDTcmwKTHBUjBAVzlGZI5JsWGp+xaDxeSXKp+D95qCrj/xZEF4DEisF3OwdYH2VRJ08DRBrrYaiiuSB9YyxL7OgzYLwupC/1MZaPMnnGmE5W0oGrmCrWP7hiJlvQbCx5H+FH0hyBH7M/mx2vF2Icm5KslZ3zE/2T8S1pZ4yJ+LIE4hkQlsj9zibXAez1BhKzTXuMGVXdYTcxs3l9Jwp+L/t92YpZKedj2Lg6DQnOTuRkCd8hccO7E7nepcXD9qT9kbscckjAE3YLV2iUd15y/SuG8dap4qIT5hjl3YUyV1w7O+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bvqyzn1K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bvqyzn1K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfVyF0cHVz2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 04:16:00 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so11715921fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730394956; x=1730999756; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FthgIjAqLOLHlW+bbPCASseCj6Y1lbUXeoQ5RfEPC2g=;
        b=bvqyzn1KEH8O2vOH9IkWTcg8Rk1r6tsu+gUVlSath9dEhnKtXHlL+timuGSJmFyIla
         hnTh8SRdAApMVzsNsy0UBYkw9j/viF/qmxEzKI83zwlDDFL24YrvcyPtzGhuGV4Wpflg
         ZGBZuqBYOg+OnyQTMYHfNqt1q5hp/1M8NNWNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730394956; x=1730999756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FthgIjAqLOLHlW+bbPCASseCj6Y1lbUXeoQ5RfEPC2g=;
        b=bmugk4QIrFFTqJwbJllW9KRQQcLXJk2ISFFOQw6UGqMLM4jSaePfFf7QD8omDqPCUW
         cJaFN+ceVm6YuM+mzBilqMEOkYG0lEfTINFLk019bXZKcf8RZErNEWn/1CZMDKni/98+
         Xx/OMoloISj4PW0yfMeX7QZGtHQ7DpY5QbSOSTgFT4K8/SkCwEgsmg5YRE8EO93vm30y
         WpBdhKnVWnsC+zfMhSfK+MJ5PNAu/lCdiV/44PXJtsEGyfgjCqs0OzXGAN0keBlHmnsP
         YgWgYjd0Nd27zLNcWen5bTlaBMCLzlglP8ZSyc1Ep3edaCw5JegLlpSuUE4cyq9BFEFU
         L5GA==
X-Forwarded-Encrypted: i=1; AJvYcCWGLpcjlZPpPGHpBi/DXTrtDhgHe1usEsgEaFfXarQQ13xk7qI90AUGdOSjaDUodmh2VFWUdCQpDKDPlf8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz78lrX+sJJnRjqPWlZ37cx4SpYB+y9g9dDQ93+AbISnn1jsOA/
	a60Ub5gN8VcBrFxyNjXBHHs8CwvpHjqYvQv57uvkt8dDlBf+8Au8SXz8CRGGiw==
X-Google-Smtp-Source: AGHT+IH9MeS0Ax989nuL+76nnyjmZEpJ6kAlmbQ9fbTl6gSc7YUojU8nnLTZuojFuuIYn0X+UAcr8A==
X-Received: by 2002:a05:651c:1504:b0:2fb:5014:abf9 with SMTP id 38308e7fff4ca-2fcbe04f0bamr96395301fa.31.1730394954583;
        Thu, 31 Oct 2024 10:15:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d69845csm32794345e9.47.2024.10.31.10.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 10:15:53 -0700 (PDT)
Message-ID: <d9c01354-853c-459b-9da4-3c1d77102749@broadcom.com>
Date: Thu, 31 Oct 2024 10:15:38 -0700
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const
 pointers
To: Caleb Sander Mateos <csander@purestorage.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Brett Creeley
 <brett.creeley@amd.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, David Arinzon
 <darinzon@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Felix Fietkau <nbd@nbd.name>, Geetha sowjanya <gakula@marvell.com>,
 hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Louis Peens <louis.peens@corigine.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Noam Dagan <ndagan@amazon.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>,
 Shannon Nelson <shannon.nelson@amd.com>, Shay Agroskin <shayagr@amazon.com>,
 Simon Horman <horms@kernel.org>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev
References: <20241031002326.3426181-1-csander@purestorage.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241031002326.3426181-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/30/24 17:23, Caleb Sander Mateos wrote:
> Make the start and end arguments to dim_calc_stats() const pointers
> to clarify that the function does not modify their values.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

