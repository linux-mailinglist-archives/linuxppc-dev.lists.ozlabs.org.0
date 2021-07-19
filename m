Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28C3CCE25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 08:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSt1M1PDwz3bZj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:56:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=fZXGbcz2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=j0mfH/Su;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=94.100.178.49; helo=fallback9.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=fZXGbcz2; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=j0mfH/Su; 
 dkim-atps=neutral
Received: from fallback9.mail.ru (fallback9.mail.ru [94.100.178.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSt0q542Zz2yfr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 16:56:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jlVPb7XqgScpfTAiq8xf+wIhk75doE3OweTWVPymt5Q=; 
 t=1626677771;x=1627283171; 
 b=fZXGbcz2pHTRVkStUbzyRP+wM5IpddFWhHIGDFShDWxXM48mw+FxXOAa713u1dZLGQx4LPg1TXd2LQ68mCfZCvDn7yJjFH/5WiE3QtqGX8u35qvEop36/W3RAgQVEZ83/UABv/O2yF32y81HUjsbPDkhPUWyOX6uauseRu+XZmU=;
Received: from [10.161.16.37] (port=41742 helo=smtp63.i.mail.ru)
 by fallback9.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1m5NC9-0008M8-Px; Mon, 19 Jul 2021 09:56:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jlVPb7XqgScpfTAiq8xf+wIhk75doE3OweTWVPymt5Q=; 
 t=1626677765;x=1627283165; 
 b=j0mfH/SudyMMvimDXmI6ja1RntA7oHK5wscgac7BCqqN6hxIiWS+Q5YOqEqKSXzvqFkz6JzaNj3tpid2BM7wsyZkEkbPN3yVE4XrHkYk/ssTKpbquCGfbQ0hqH+F/FjlJMo50TR2V8D8TWDpgnYICk28nmMau0z+hn+lmmjlQDQ=;
Received: by smtp63.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m5NC0-0008Kf-Kd; Mon, 19 Jul 2021 09:55:57 +0300
Subject: Re: [PATCH] soc: fsl: qe: convert QE interrupt controller to
 platform_device
To: Li Yang <leoyang.li@nxp.com>
References: <20210705111250.1513634-1-fido_max@inbox.ru>
 <CADRPPNRYDBFHEppfpYLwsy7MMEdtsOLS764MJboL9ERW0-KK3Q@mail.gmail.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <ec981260-fbe3-5cc4-1da3-dfb2f70f8f85@inbox.ru>
Date: Mon, 19 Jul 2021 09:58:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNRYDBFHEppfpYLwsy7MMEdtsOLS764MJboL9ERW0-KK3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C30288BCF456A452EC92BAB6D044D5CCDE182A05F538085040970E04EB18AC644E62BB44EC95E4DE5D7E6CFC7276E5AB684A5E87B9EF38C923
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B5932F77F0041FFB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8624C5589F4A67543EA42AE62D2A384966F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE719E4A684E2A1C1059FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063768889A976CB567F3D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE70DE4A3D039A8938BEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3EBF4D8D28E8B690335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5BDAB937D0AAAF409900C4707482EDA874E14DF739995CE16D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342E8FEDBD32DECB6DC437571DECC2E525555548622D32E58AA652C9B4DDF8FAF8BEA16A2CF5DD50191D7E09C32AA3244C155573CC54E23DA102D5B3B2736B6A1DD9ADFF0C0BDB8D1FDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+8+KVR9NZrGMW3pz8SWWqg==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB241E30759B32BE3EAEAC99A2C7D853D61063DB8BCE4C7EAB77EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4DE24245422D83CE6F6EF26CB7A2DAAF2AD80CE56E34D1B8B049FFFDB7839CE9E74D7C836B7A62AF36E4DA991870F257BCD2B5554D74425294E2ADDE868B22C20
X-7FA49CB5: 0D63561A33F958A5F817D3147438D2EB216344FC4F7B9A042139A057198A38C8CACD7DF95DA8FC8BD5E8D9A59859A8B6F657401E1635F1D7CC7F00164DA146DAFE8445B8C89999728AA50765F79006372255A60090D554F4389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8DA7BFA4571439BB2F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C568FCE88E0C8489D2D242C3BD2E3F4C64AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B60E26A56DB46E81E4089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5F817D3147438D2EB216344FC4F7B9A0473D271DEF64DE5B1D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+8+KVR9NZrE4QyZrWTrpSw==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C90059D04A353E0DED3E654C6AA2CA14A4DDCBEE6447B0D21ED662C417F07DC1D704CC099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
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
Cc: saravanak@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

15.07.2021 01:29, Li Yang wrote:
>  From the original code, this should be type = "qeic".  It is not
> defined in current binding but probably needed for backward
> compatibility.

I took these strings from this part:

        np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");

        if (!np) {

                np = of_find_node_by_type(NULL, "qeic");

                if (!np)

                        return -ENODEV;

        }

However I can't find usage of "qeic" in any dts, so I will drop this in V2
